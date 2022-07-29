class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @books = @books.filter_by_authors(params[:authors]) if params[:authors].present?
    @books = @books.filter_by_years(params[:years]) if params[:years].present?
    @books = @books.filter_by_pages(params[:min_page], params[:max_page]) if params[:min_page].present? || params[:max_page].present?
    @books = @books.page(params[:page])
  end

  def show; end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end

  private

  def get_book
    @book = Book.find(params[:id])
  end
end
