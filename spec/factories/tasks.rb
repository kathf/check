FactoryGirl.define do
  factory :task do
    sequence :description do |n|
      "Task#{n}"
    end
    due_at { Time.at(Time.now.to_i + rand(604800..10032000)).to_s }
    completed_at { 1 + rand(4) }
  end
end
