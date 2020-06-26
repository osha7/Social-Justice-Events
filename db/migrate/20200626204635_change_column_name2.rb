class ChangeColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_events, :events_id, :event_id
  end
end
