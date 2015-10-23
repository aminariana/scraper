class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :rank
      t.text :url
      t.text :description

      t.timestamps null: false
    end
  end
end
