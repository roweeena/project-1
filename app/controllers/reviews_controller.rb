class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new review_params
    user = User.find params[:user_id]
      user.reviews << @review
      @current_user.reviews << @review
    redirect_to user
  end

  def show
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to user
  end

  private
  def review_params
    params.require(:review).permit(:message)
  end
end
