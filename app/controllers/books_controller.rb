class BooksController < ApplicationController
  check_authorization
  load_and_authorize_resource

  prepend_before_filter do
    params[:book] &&= book_params
  end

  def index

  end

  def new

  end

  def create
    if @book.save
      redirect_to books_path, notice: 'Book was created successfully.'
    else
      flash.now[:error] = 'Some error prohibited this book from being saved.'
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title)
  end
end
