class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]
  before_action :create_array, only: [:create, :update]
  after_action :create_author_book, only: [:create, :update]

  def index
    @books = Book.all
    @books = @books.filter_by_authors(params[:authors]) if params[:authors].present?
    @books = @books.filter_by_years(params[:years]) if params[:years].present?
    @books = @books.filter_by_pages(params[:min_page], params[:max_page]) if params[:min_page].present? || params[:max_page].present?
    @books = @books.page(params[:page])
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  private

  def get_book
    @book = Book.find(params[:id])
  end

  def create_author_book
    author_ids = params[:book][:author_ids].split(',').map { |str| str.strip }
    author_ids.each do |author_id|
      AuthorBook.find_or_create_by(
        author_id: author_id,
        book_id: @book.id,
      )
    end
  end

  def book_params
    params.require(:book).permit(
      :content_name,
      :isbn,
      :year,
      :language_code,
      :category,
      :plot,
      :copyright,
      :title,
      :average_rating,
      :rating_count,
      :description,
      :loc_class,
      :pages,
      :language,
      :isbn13,
      :release_date,
      :author_id,
      :cover,
      :summary,
      :content_cleaned,
      :content_available,
      classes: [],
      images: [],
      genres: [],
      similar_books: [],
      wikipedia: [:url, :found, :year],
      goodreads: [:url, :found, :year],
      gutenberg: [:url, :found, :year],
    )
  end

  def create_array
    if params[:book][:similar_books].present?
      params[:book][:similar_books] = params[:book][:similar_books].split('|').map { |str| str.strip }
    end
  end
end
