# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  isbn       :string(32)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Book < ActiveRecord::Base
  validates :isbn,  presence: true, uniqueness: true
  validates :title, presence: true

  belongs_to :user
end
