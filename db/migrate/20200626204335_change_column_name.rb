class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_events, :attendees, :admin
  end
end
