class ReviewsController < ApplicationController

  def index
    @reviews = find_reviews_with_reviewee_id
  end


  def create
    @review = Review.new create_review_params
    unless review_verification(@review)
      return
    end

    if(@review.save)
      calculate_rating(@review.reviewee)
      redirect_to user_reviews_path(reviewee_id), notice: "Successfully submitted review!"
    else
      render :new
    end
  end

  def new
    @review = Review.new
  end

  def show
  end

  def destroy
    @review = find_review_with_id
    unless review_verification(@review)
      return
    end
    @reviewee = @review.reviewee
    @review.destroy
    redirect_to user, notice: "Successflly deleted review"
  end

  private
  def create_review_params
    params.require(:review).permit(:reviewer_id, :reviewee_id,:message)
  end

  def find_reviews_with_reviewee_id
      Review.where(reviewee_id: reviewee_id)
    end

end
