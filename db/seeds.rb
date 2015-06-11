# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


category_array = ["work","leisure","study"]

category_array.each do |elem|
  Category.create!(name: elem)
end

user_array = [
  {username: "greg", email: "greg@email"},
  {username: "lucy", email: "lucy@email"},
  {username: "mark", email: "mark@email"},
  {username: "felix", email: "felix@email"},
  {username: "pepper", email: "pepper@email"}
  ]

user_array.each do |user|
  User.create!(username: 'user[:username]', email: 'user[:email]')
end

list_array = {
  shopping: ['Kale', 'Brocoli', 'Pasta', 'Potatoes', 'Tomatoes', 'Coffee'],
  places: ["Panama Canal", "Venice", "Greek Islands"],
  errands: ["Drycleaning", "Clean the car"]
  }

list_array.each_pair do |list, tasks_array|
  list1 = List.create!(name: list)

  tasks_array.each do |task|
    due = Time.at(Time.now.to_i + rand(604800..10032000)).to_s
    bina = rand(1)
    prior = 1 + rand(4)

    list1.tasks.create!(description: task, due_at: due, priority: prior)
  end

end
