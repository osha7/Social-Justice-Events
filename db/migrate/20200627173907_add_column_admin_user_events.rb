class AddColumnAdminUserEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :user_events, :admin, :boolean
  end
end
