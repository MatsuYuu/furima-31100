class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
  end

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
