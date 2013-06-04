class RatingsController < ApplicationController
  check_authorization
  load_and_authorize_resource

  prepend_before_filter do
    params[:rating] &&= rating_params
  end

  def create
    @rating.book = Book.find(params[:book_id])
    @rating.user = current_user
    @rating.save
  end

  def update
    @rating.update_attributes(rating_params)
  end

  protected

  def rating_params
    params.require(:rating).permit(:grade)
  end
end
