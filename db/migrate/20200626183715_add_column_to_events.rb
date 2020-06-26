class AddColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :about_content, :text
  end
end
