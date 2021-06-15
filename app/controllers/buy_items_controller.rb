class BuyItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :buy_item_nil, only: [:index, :create]

  def index
    @item_address = ItemAddress.new
  end

  def create
    @item_address = ItemAddress.new(buy_item_params)
    if @item_address.valid?
      @item_address.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_item_params
    params.require(:item_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
  end

  def buy_item_nil
    @buy_item = BuyItem.find_by(item_id: @item.id)
    redirect_to root_path unless @buy_item.nil?
  end
end
