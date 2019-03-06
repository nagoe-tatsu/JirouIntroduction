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
    @shop = shop.find(params[:id])
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :description)
  end
end
