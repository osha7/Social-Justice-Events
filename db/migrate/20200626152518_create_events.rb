class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.date :date
      t.time :time
      t.string :about_content
  

      t.timestamps
    end
  end
end
