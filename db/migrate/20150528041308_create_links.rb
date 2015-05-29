class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :task
      t.string :url
      t.string :description
      t.timestamps null: false
    end
  end
end
