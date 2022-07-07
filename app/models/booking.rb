class Booking < ApplicationRecord
  belongs_to :pet #owner of pet
  belongs_to :user #user who booked
  enum status: [:pending, :confirmed, :cancelled]
end
