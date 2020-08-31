class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item_purchase = ItemPurchase.new(item_purchase_params)
    @item = Item.find(params[:item_id])
  end

  def create
    @item_purchase = ItemPurchase.new(item_purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def done
    @item_purchase = Item.find(params[:id])
    @item_purchase.update(item_purchases_id: current_user.id)
  end


  private

  def item_purchase_params
    params.permit(:user_id, :item_id, :token)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_purchase_params[:user_id, :item_id],
      card: item_purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
