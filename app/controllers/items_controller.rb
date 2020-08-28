class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :require_login]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show     
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
