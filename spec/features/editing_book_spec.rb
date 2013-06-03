# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'New Book' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book, user: user) }

  before do
    user.confirm!
    login_as user, scope: :user
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
