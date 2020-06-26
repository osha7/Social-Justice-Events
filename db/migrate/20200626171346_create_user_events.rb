class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.integer :user_id
      t.integer :events_id
      t.string :attendees
      t.string :comments

      t.timestamps
    end
  end
end
