class AddUserToRegisteredApps < ActiveRecord::Migration
  def change
    add_reference :registered_apps, :user, index: true, foreign_key: true
  end
end
