class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :recoverable, :registerable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 3..10 }
end
