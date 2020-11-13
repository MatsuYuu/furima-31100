class BuysController < ApplicationController
  def index
    redirect_to root_path unless user_signed_in?
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
    redirect_to root_path if @item.buy.present? || @item.user_id == current_user.id
  end

  def create
    @buy_item = BuyItem.new(buyitem_params)
    @item = Item.find(params[:item_id])
    if @buy_item.valid?
      pay_item
      @buy_item.save
      @item.save
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
end
