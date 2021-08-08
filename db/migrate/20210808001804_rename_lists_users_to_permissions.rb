class RenameListsUsersToPermissions < ActiveRecord::Migration[5.2]
  def change
    rename_table :lists_users, :permissions
  end
end
