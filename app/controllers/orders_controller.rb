class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefecture_id, :local_goverment, :house_number, :building, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_93d0bbe0271d06f1d6e3361f"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end


