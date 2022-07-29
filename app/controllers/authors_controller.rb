class AuthorsController < ApplicationController
  before_action :get_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
    @authors = @authors.filter_by_names(params[:names]) if params[:names].present?
    @authors = @authors.page(params[:page])
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

  def get_author
    @author = Author.find(params[:id])
  end
end
