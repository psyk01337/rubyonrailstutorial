class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name"
      t.integer "permalink" 
      t.integer "position"
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
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
  
  def down
  drop_table  :pages
  end
end
