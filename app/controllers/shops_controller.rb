class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: "店舗を登録しました。"
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to @shop, notice: "店舗を更新しました。"
    else
      render :edit
    end
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :description, :new_image)
  end
end
