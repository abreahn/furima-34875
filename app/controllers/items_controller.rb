class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = ItemTag.new
  end

  def create
    @item = ItemTag.new(item_tag_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def item_tag_params
    params.require(:item_tag).permit(:tag_name, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id, item_id: params[:id])
  end

  def item_params
    params.require(:item).permit(:tag_name, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id || @item.purchase.present?
  end
end
