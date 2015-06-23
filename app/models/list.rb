class List < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true, uniqueness: true
  belongs_to :user
end
