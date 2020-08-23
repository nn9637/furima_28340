class ItemsController < ApplicationController
 
  def index
    @items = Item.all
  end


  private

  def items_params 
    params.permit :image
  end

end