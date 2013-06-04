# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Edit rating' do
  include Warden::Test::Helpers
  Warden.test_mode!

  after { Warden.test_reset! }

  subject { page }

  let(:user) { FactoryGirl.create(:admin_user) }
  let(:another_user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
    login_as user, scope: :user
  end

  describe 'admin can edit rating from any user' do
    let(:book) { FactoryGirl.create(:book, user: user) }
    let!(:rating) { FactoryGirl.create(:rating, user: another_user, book: book) }

    before do
      visit book_path(book)
    end

    it 'should show the form to edit rating' do
      should have_content('Edit this grade')
    end
  end
end
