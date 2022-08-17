class AddIdsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :room, foreign_key: true
  end
end
