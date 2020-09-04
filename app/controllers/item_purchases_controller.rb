class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase

  def index
    @item_purchase = UserPurchase.new
    redirect_to root_path if current_user.id == @item.user.id || @item.item_purchase
  end

  def create
    @item_purchase = UserPurchase.new(item_purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end


  private

  def item_purchase_params
    params.permit(:token, :postal_code, :prefecture_code, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end