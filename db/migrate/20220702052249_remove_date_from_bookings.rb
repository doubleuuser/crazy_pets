class RemoveDateFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :date, :string
  end
end
