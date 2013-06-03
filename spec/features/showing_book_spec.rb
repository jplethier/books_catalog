# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'New Book' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }

  before do
    user.confirm!
    login_as user, scope: :user
    visit book_path(book)
  end

  it 'should show the book infos' do
    should have_content(book.title)
    should have_content(book.isbn)
  end
end
