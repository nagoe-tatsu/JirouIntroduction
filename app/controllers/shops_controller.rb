class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :destroy]

  def index
    @shops = Shop.with_attached_image.find_newest_shops(params[:page])
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
    @shop = Shop.with_attached_image.includes(reviews: :user).find(params[:id])
  end

  def edit
    
  end

  def update
    
    if @shop.update(shop_params)
      redirect_to @shop, notice: "店舗を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    
    @shop.destroy
    redirect_to shops_path, notice: "店舗を削除しました。"
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :description, :new_image)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
