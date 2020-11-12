class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
  end

  def create
    binding.pry
    @buy_item = BuyItem.new(buyitem_params)
    @item = Item.find(params[:item_id])
    if  @buy_item.valid?
        @buy_item.save
        @item.save
        redirect_to root_path
    else
        render action: :index
    end
  end

  private

  def buyitem_params
    params.require(:buy_item).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end


