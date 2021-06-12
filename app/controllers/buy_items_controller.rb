class BuyItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new
  end

  def create
    @item_adress = ItemAddress.new(buy_item_params)
    if @item_adress.valid?
      @item_adress.save
      redirect_to :index
    else
      render :index      
    end
  end

  private

  def buy_item_params
    params.require(:item_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
