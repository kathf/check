class CreateCategoriesTasks < ActiveRecord::Migration
  def change
    create_table :categories_tasks do |t|
      t.references :category, :task
    end
  end
end
