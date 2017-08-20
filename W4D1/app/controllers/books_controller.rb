class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new

  end

  def create
    Book.new(book_params).save
    redirect_to "http://localhost:3000/books"
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to "http://localhost:3000/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
