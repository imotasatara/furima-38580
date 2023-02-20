class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:update, :show, :edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def correct_user
    @item = Item.find(params[:id])
    @user = @item.user
    redirect_to(root_path) unless @user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
