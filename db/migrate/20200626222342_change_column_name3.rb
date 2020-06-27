class ChangeColumnName3 < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_events, :comments, :comment
  end
end
