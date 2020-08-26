class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :require_login]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
    else
      render :new
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
