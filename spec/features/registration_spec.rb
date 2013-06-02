# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Registraion' do
  subject { page }

  let(:user) { FactoryGirl.build(:user) }

  before do
    visit new_user_registration_path
  end

  it 'successfully' do
    within 'article' do
      fill_in 'user_username', :with => user.username
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      fill_in 'user_password_confirmation', :with => user.password_confirmation
      click_on 'Sign up'
    end
    should have_content('A message with a confirmation link has been sent to your email address. Please open the link to activate your account.')
  end

  it 'failure' do
    within 'article' do
      # fill_in 'user_username', :with => user.username
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      fill_in 'user_password_confirmation', :with => user.password_confirmation
      click_on 'Sign up'
    end
    should have_content('errors prohibited this user from being saved:')
  end
end