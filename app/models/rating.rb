# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  grade      :integer
#  book_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :user,  presence: true
  validates :book,  presence: true
  validates :grade, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
