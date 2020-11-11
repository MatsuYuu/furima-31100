class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buyitem_params)
    @item = Item.find(params[:item_id])
    if  @buy_item.valid?
        @buy_item.save
        @item.save
        redirect_to action: :index
    else
        render action: :index
    end
  end

  private

  def buyitem_params
    params.permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number)
  end
end


