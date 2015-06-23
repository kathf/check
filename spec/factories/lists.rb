FactoryGirl.define do
  factory :list do
    sequence :name do |n|
      "List#{n}"
    end
    task
  end
end
