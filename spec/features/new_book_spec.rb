# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'New Book' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.build(:book) }

  describe 'logged' do

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

  it 'guest should be redirect to home page' do
    visit new_book_path
    should have_content('You are not authorized to access this page.')
    should have_content('Books list')
  end
end
