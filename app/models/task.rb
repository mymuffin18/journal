class Task < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 5}

  validates_date :date, on_or_after: :today, on: :create
  belongs_to :category
end
