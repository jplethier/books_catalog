# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Login' do
  let(:user) { FactoryGirl.create(:user, password: '123qwe', password_confirmation: '123qwe') }

  before do
    user.confirm!
  end

  context 'in sign_in page' do
    before do
      visit new_user_session_path
    end

    it 'successfully' do
      within 'article' do
        fill_in 'user_login', :with => user.email
        fill_in 'user_password', :with => user.password
        click_on 'Login'
      end
      should have_content('Signed in successfully.')
    end

    it 'successfully with username' do
      within 'article' do
        fill_in 'user_login', :with => user.username
        fill_in 'user_password', :with => user.password
        click_on 'Login'
      end
      should have_content('Signed in successfully.')
    end

    it 'with unregistered username' do
      within 'article' do
        fill_in 'user_login', :with => 'AAAAAAAA'
        fill_in 'user_password', :with => user.password
        click_on 'Login'
      end
      should have_content('Login or password invalid.')
    end
  end

  context 'in home page' do
    before do
      visit root_path
    end

    it 'successfully with email' do
      fill_in 'user_login', :with => user.email
      fill_in 'user_password', :with => user.password
      click_on 'Login'
      should have_content('Signed in successfully.')
    end

    it 'successfully with username' do
      fill_in 'user_login', :with => user.username
      fill_in 'user_password', :with => user.password
      click_on 'Login'
      should have_content('Signed in successfully.')
    end

    it 'with unregistered username' do
      fill_in 'user_login', :with => 'AAAAAAAA'
      fill_in 'user_password', :with => user.password
      click_on 'Login'
      should have_content('Login or password invalid.')
    end
  end
end
