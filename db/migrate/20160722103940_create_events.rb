class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
     t.string :title
     t.string :timings
     t.text :categories
     t.string :eventlocation
     t.text :cost
     t.string :sponser
     t.string :venue
     t.text :details
     
     t.timestamps
    end
  end
end
