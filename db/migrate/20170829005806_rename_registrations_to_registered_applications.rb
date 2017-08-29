class RenameRegistrationsToRegisteredApplications < ActiveRecord::Migration
  def change
    rename_table :registrations, :registered_applications
  end
end
