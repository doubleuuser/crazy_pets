class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  enum status: [:pending, :confirmed, :cancelled]
end
