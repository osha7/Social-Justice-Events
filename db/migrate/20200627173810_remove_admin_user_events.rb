class RemoveAdminUserEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_events, :admin, :string
  end
end
