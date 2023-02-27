class SalesController < ApplicationController
  before_action :move_to_index
  before_action :correct_user
  before_action :set_item

  def index
    @sales_address = SalesAddress.new
  end

  def create
    @sales_address = SalesAddress.new(sales_params)
    if @sales_address.valid?
      @sales_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sales_params
    params.require(:sales_address).permit(
      :postal_code, :prefecture_id, :town_name, :house_number, :building_name, :phone_number, :sale_id
    ).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def correct_user
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to(root_path)
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
