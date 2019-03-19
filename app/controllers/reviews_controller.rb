class ReviewsController < ApplicationController
  before_action :set_shop, only: [:show, :new, :edit]
  before_action :set_review, only: [:show, :edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.attributes = {
      shop_id: params[:shop_id],
      user_id: current_user.id
    }
    if @review.save
      redirect_to @review.shop, notice: "レビューを登録しました。"
    else
      render :new
    end
  end  
  
  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.shop, notice: "レビューを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.shop, notice: "レビューを削除しました。"
  end

  private  
  
  def review_params
    params.require(:review).permit(:title, :body, :evaluation)
  end  
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end