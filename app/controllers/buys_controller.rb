class BuysController < ApplicationController

  def index
    @user_buyitem = BuyItem.new
  end

  def create
    @user_buyitem = BuyItem.new(buyitem_params)
    if  @user_buyitem.valid?
        @user_buyitem.save
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


