class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end
  def new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:title, :price, :seller, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :shipping_area_id, :day_id).merge(user_id: current_user.id)
  end
end
