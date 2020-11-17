class BuysController < ApplicationController
  before_action :set_buy, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
     if @item.buy.present? || @item.user_id == current_user.id
      redirect_to root_path
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buyitem_params)
    if @buy_item.valid?
      @buy_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyitem_params
    params.require(:buy_item).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyitem_params[:token],
      currency: 'jpy'
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end
end
