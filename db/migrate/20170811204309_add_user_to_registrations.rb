class AddUserToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :user, index: true, foreign_key: true
  end
end
