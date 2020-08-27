class ItemPurchasesController < ApplicationController

  def  done
    @item_purchases = Item.find(params[:id])
    @item_purchases.update( item_purchases_id: current_user.id)
  end

end