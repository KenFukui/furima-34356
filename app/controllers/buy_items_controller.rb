class BuyItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new
  end

  def create
    @item_address = ItemAddress.new(buy_item_params)
    if @item_address.valid?
      @item_address.save
      redirect_to root_path
    else
      render :index      
    end
  end

  private

  def buy_item_params
    params.require(:item_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_cd39b7ad53146044fad668c5"  
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end
