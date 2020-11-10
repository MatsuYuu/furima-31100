class BuysController < ApplicationController

  def index
    @user_object = BuyItem.new
  end

  def create
   @user_object = BuyItem.new(object_params)
    if  @user_object.valid?
        @user_object.save
        redirect_to action: :index
    else
        redirect_to root_path
    end
  end

  private

  def object_params
    params.require(:user_object).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number)
  end
end


