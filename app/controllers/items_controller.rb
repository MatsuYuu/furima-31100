class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
  end

  private

  def message_params
    params.require(:item).permit(:image, :category, :day, :status, :area, :burden).merge(user_id: current_user.id)
  end
end
