class ItemPurchasesController < ApplicationController

  def index
  end

  def create
  end

  def done
    @purchase = Item.find(params[:id])
    @purchase.update(item_purchases_id: current_user.id)
  end
end
