# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'New Book' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.build(:book) }

  before do
    user.confirm!
    login_as user, scope: :user
    visit new_book_path
  end

  it 'successfully' do
    fill_in 'book_title', with: book.title
    fill_in 'book_isbn', with: book.isbn
    click_on 'Confirm'
    should have_content('Book was created successfully.')
  end

  it 'failure' do
    # fill_in 'book_title', with: book.title
    fill_in 'book_isbn', with: book.isbn
    click_on 'Confirm'
    should have_content('Some error prohibited this book from being saved.')
  end
end
