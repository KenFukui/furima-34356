class BuyItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_adress = ItemAddress.new
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
    params.require(:item_adress).permit()
  end

end
