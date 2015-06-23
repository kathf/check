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

margie = User.create!(first_name: "Margie", last_name: "Wilkinson", email: "margie@wilkinson.com", password: "password", password_confirmation: "password")


list_array = {
  shopping: ['Kale', 'Brocoli', 'Pasta', 'Potatoes', 'Tomatoes', 'Coffee'],
  places: ["Panama Canal", "Venice", "Greek Islands"],
  errands: ["Drycleaning", "Clean the car"]
  }

def completed_date
  Time.at(Time.now.to_i - rand(10032000))
end

#completed_at_enum = [nil, completed_date].cycle
completed_at_enum = [nil, Proc.new { completed_date }].cycle

list_array.each_pair do |list, tasks_array|
  list1 = List.create!(name: list, user_id: 1)

  tasks_array.each do |task|
    due = Time.at(Time.now.to_i + rand(604800..10032000)).to_s
    bina = rand(1)
    prior = 1 + rand(4)

    list1.tasks.create!(
      description: task,
      due_at: due,
      completed_at: completed_at_enum.next.try(:call),
      priority: prior
    )
  end

end
