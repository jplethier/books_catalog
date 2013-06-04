require 'spec_helper'

describe User do
  subject { user }

  let(:user) { FactoryGirl.build :user }

  its(:valid?) { should be_true }

  describe 'validations' do
    describe 'email' do
      it 'is required' do
        expect{ user.email = nil }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be valid' do
        expect{ user.email = 'invalidemail' }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be unique' do
        existing_user = FactoryGirl.create :user, email: 'duplicated@example.com'
        expect{ user.email = existing_user.email }.to change{ user.valid? }.from(true).to(false)
      end
    end

    describe 'password' do
      it 'is required' do
        expect{ user.password = nil }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be equal to password_confirmation' do
        user.password = 'F_PASSWORD'
        user.password_confirmation = 'F_PASSWORD'
        expect{ user.password = "CHANGED_PASSWORD" }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be at least 6 characteres' do
        expect{ user.password = 'p'*5 }.to change{ user.valid? }.from(true).to(false)
      end
    end

    describe 'username' do
      it 'is required' do
        expect{ user.username = nil }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be at least 3 characteres ' do
        expect{ user.username = 'US' }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be at most 10 characteres ' do
        expect{ user.username = 'U'*11 }.to change{ user.valid? }.from(true).to(false)
      end

      it 'has to be unique' do
        existing_user = FactoryGirl.create :user, username: 'username'
        expect{ user.username = existing_user.username }.to change{ user.valid? }.from(true).to(false)
      end
    end
  end

  # describe 'methods' do
  #   describe 'find_first_by_auth_conditions' do
  #     before do
  #       user.save
  #       user.confirm!
  #     end
  #     it 'with login parameter' do
  #       expect{ User.find_first_by_auth_conditions(login: user.username) }.to eq(user)
  #     end

  #     it 'without login parameter' do
  #       expect{ User.find_first_by_auth_conditions(email: user.username) }.to eq(user)
  #     end
  #   end
  # end
end
