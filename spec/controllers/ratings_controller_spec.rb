require 'spec_helper'

describe RatingsController do

  let(:book)   { stub_model(Book, title: 'title', isbn: 'isbn') }
  let(:user)   { stub_model(User) }
  let(:rating) { stub_model(Rating, book: book, user: user, grade: 3) }

  before { sign_in user }

  describe 'create' do
    let(:params)  { { book_id: 1, rating: { grade: 3 } } }

    it 'successfully' do
      Rating.stub(new: rating)
      rating.stub(save: true)
      Book.stub(find: book)
      xhr :post, :create, params
      expect(response).to be_success
    end

    it 'failure' do
      Rating.stub(new: rating)
      rating.stub(save: false)
      Book.stub(find: book)
      xhr :post, :create, params
      expect(response).to be_success
    end
  end

  describe 'update' do
    let(:params)  { { book_id: 1, id: 1, rating: { grade: 3 } } }

    it 'successfully' do
      Rating.stub(find: rating)
      rating.stub(update_attributes: true)
      xhr :post, :update, params
      expect(response).to be_success
    end

    it 'failure' do
      Rating.stub(find: rating)
      rating.stub(update_attributes: false)
      xhr :post, :update, params
      expect(response).to be_success
    end
  end
end
