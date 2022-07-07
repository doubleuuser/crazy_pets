class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  enum status: [:created, :completed, :cancelled]
end
