class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer "page_id"
      t.string "name" 
      t.integer "position"
      t.boolean "visible", :default => false
      t.string "content__type"
      t.text "content"
      #t.column "first_name", :string, :limit => 25
      #t.string "name", :limit => 50
      #t.string "email", :default => "", :null => false
      #t.string "password", :limit => 40
      #t.datetime "created_at"
      #t.datetime "updated_at"
      #t.type "name", options
      t.timestamps null: false
    end
    add_index("sections", "page_id")
  end
end
