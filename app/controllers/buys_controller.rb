class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
     unless user_signed_in?
      redirect_to new_user_session
     end
    @buy_item = BuyItem.new
    if @item.buy.present? or @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @buy_item = BuyItem.new(buyitem_params)
    if @buy_item.valid?
      pay_item
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
      amount: Item.find(params[:item_id]).price,
      card: buyitem_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
