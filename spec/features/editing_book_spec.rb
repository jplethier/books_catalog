# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'New Book' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
    login_as user, scope: :user
  end

  describe 'edit a book from myself' do
    let(:book) { FactoryGirl.create(:book, user: user) }

    before do
      visit edit_book_path(book)
    end

    it 'successfully' do
      fill_in 'book_title', with: 'Change Title'
      fill_in 'book_isbn', with: book.isbn
      click_on 'Confirm'
      should have_content('Book was updated successfully.')
      should have_content('Change Title')
    end

    it 'failure' do
      fill_in 'book_title', with: ''
      fill_in 'book_isbn', with: book.isbn
      click_on 'Confirm'
      should have_content('Some error prohibited this book from being updated.')
    end
  end

  describe 'edit a book from another user' do
    let(:book) { FactoryGirl.create(:book, user: another_user) }

    it 'should redirect to home page' do
      visit edit_book_path(book)
      should have_content('You are not authorized to access this page.')
      should have_content('Books list')
    end
  end
end
