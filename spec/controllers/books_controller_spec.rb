require 'rails_helper'

describe BooksController, type: :controller do
  describe "GET index" do
    before do
      create(:author, :with_3_books, name: 'Robert')
      create(:author, :with_3_books, name: 'Kiyosaki')
    end

    it 'should set @books instance variable' do
      get :index

      expect(assigns(:books)).to be_present      
    end

    it 'should paginate' do
      create(:author, :with_50_books)

      get :index

      expect(assigns(:books).count).to eq 25
    end

    it 'should filter by author names' do
      create(:author, :with_3_books, name: 'Thanos')

      get :index, params: { authors: 'rob,kiyo' }

      expect(assigns(:books).count).to eq 6
    end

    it 'should filter by years' do
      get :index, params: { years: '1992,1993' }

      expect(assigns(:books).count).to eq 4
    end

    it 'should filter by pages' do
      get :index, params: { min_page: 150, max_page: 250 }

      expect(assigns(:books).count).to eq 2
    end
  end
end
