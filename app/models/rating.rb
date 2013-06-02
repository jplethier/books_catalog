class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :user,  presence: true
  validates :book,  presence: true
  validates :grade, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
