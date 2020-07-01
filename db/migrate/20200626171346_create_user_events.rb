class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :users_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :admin, default: 'false'
      t.string :comment

      t.timestamps
    end
  end
end
