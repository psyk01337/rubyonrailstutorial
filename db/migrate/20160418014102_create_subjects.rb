class CreateSubjects < ActiveRecord::Migration
  def up
      create_table :subjects do |t|
      t.string "name"
      t.string "position"
      t.boolean "visible", :default => false
      #t.column "first_name", :string, :limit => 25
      #t.string "name", :limit => 50
      #t.string "email", :default => "", :null => false
      #t.string "password", :limit => 40
      #t.datetime "created_at"
      #t.datetime "updated_at"
      #t.type "name", options
      t.timestamps null: false
    end
  end
  
  def down
  drop_table  :subjects
  end
end
