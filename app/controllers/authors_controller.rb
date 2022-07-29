class AuthorsController < ApplicationController
  before_action :get_author, only: [:show, :edit, :update, :destroy]
  after_action :create_author_book, only: [:create, :update]

  def index
    @authors = Author.all
    @authors = @authors.filter_by_names(params[:names]) if params[:names].present?
    @authors = @authors.page(params[:page])
  end

  def show; end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to author_path(@author)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy

    redirect_to authors_path
  end

  private

  def get_author
    @author = Author.find(params[:id])
  end

  def create_author_book
    book_ids = params[:author][:book_ids].split(',').map { |str| str.strip }
    book_ids.each do |book_id|
      AuthorBook.find_or_create_by(
        book_id: book_id,
        author_id: @author.id,
      )
    end
  end

  def author_params
    params.require(:author).permit(
      :bio,
      :name,
      :gender,
      :summary,
      :born,
      :died,
      wikipedia: [:url, :found],
    )
  end
end
