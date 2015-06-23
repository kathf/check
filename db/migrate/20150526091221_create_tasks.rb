class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :list
      t.string :description
      t.timestamp :due_at
      t.timestamp :completed_at
      t.integer :priority, default: 2
      t.timestamps null: false
    end
  end
end
