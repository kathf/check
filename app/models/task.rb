class Task < ActiveRecord::Base
  belongs_to :list

  has_one :link
  accepts_nested_attributes_for :link

  has_and_belongs_to_many :category
  has_one :assignment
  has_one :user, through: :assignment

  validates :description, :due_at, presence: true

  scope :incompleted_tasks, -> { where(completed_at: nil) }
  scope :completed_tasks, -> { where.not(completed_at: nil ) }
  scope :overdue, -> { where( 'due_at > ?', Time.now ) }
  scope :pending, -> { where( 'due_at < ?', Time.now) }

  def self.created_since(since)
    where( 'created_at > ?', since )
  end

  def self.due_within(within)
    where( 'due_at < ?', within )
  end

  def self.priority_higher_than(min_priority)
    where( 'priority > ?', min_priority )
  end

  def complete!
    self.completed_at = Time.now
    self.completed = true
    self.save!
  end

  def overdue?
    due_at.present? && due_at < Time.now
  end

end
