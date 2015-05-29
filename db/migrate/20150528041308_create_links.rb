class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :task
      t.text :url
      t.text :description
      t.timestamps null: false
    end
  end
end
