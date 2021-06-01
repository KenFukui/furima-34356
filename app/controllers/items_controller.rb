class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
   
  end

  def update

    if @item.update(item_params)
      redirect_to item_path
    else
      render  :edit
    end
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :fee_id, :prefecture_id, :days_id,
                                 :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to  root_path unless current_user == @item.user
  end
end
