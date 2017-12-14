class BooksController < ApplicationController
  def index
    @books = Book.all
    respond_to do |format|
      format.text
      format.html
      format.csv do
        render plain: Book.generate_csv(@books)
      end
      format.json do
        render json: @books
      end
      format.xml { render xml: @books }
    end
  end
end
