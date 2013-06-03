require 'spec_helper'

describe BooksController do

  let(:book) { stub_model(Book, title: 'title', isbn: 'isbn') }
  let(:user) { stub_model(User) }

  before { sign_in user }

  it 'new' do
    Book.stub(new: book)
    get :new
    expect(assigns :book).to eq book
  end

  it 'index' do
    Book.stub(accessible_by: [book])
    get :index
    expect(assigns :books).to eq [book]
  end

  describe 'create' do
    let(:params)  { { book: { title: :title, isbn: :isbn } } }

    it 'successfully' do
      Book.stub(new: book)
      book.stub(save: true)
      post :create, params
      expect(response).to redirect_to(books_path)
    end

    it 'failure' do
      Book.stub(new: book)
      book.stub(save: false)
      post :create, params
      expect(response).to render_template(:new)
    end
  end
end
