class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
