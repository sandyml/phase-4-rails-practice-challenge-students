class Student < ApplicationRecord
  belongs_to :instructor

  # name (must be present)
  validates :name, presence: true
  # age (must be >= 18)
  validates :age, numericality: { greater_than_or_equal_to: 18 }
end
