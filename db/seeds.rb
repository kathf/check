# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


list_array = {
  shopping: ['kale', 'brocoli', 'pasta', 'potatoes', 'tomatoes', 'coffee'],
  places: ["Panama Canal", "Venice", "Greek Islands"],
  errands: ["drycleaning", "clean the car"]
  }


list_array.each_pair do |list, tasks_array|
  list1 = List.create!(name: list)

  tasks_array.each do |task|
    due = Time.at(Time.now.to_i + rand(604800..10032000)).to_s
    completed = Time.at(Time.now.to_i - rand(1604800)).to_s
    prior = 1 + rand(4)
    list1.tasks.create!(description: task, due_at: due, priority: prior, completed: completed)
  end

end

category_array = ["work", "leisure", "study"]
category_array.each do |elem|
  cat = Category.create!(name: elem)
end
