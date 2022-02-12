class Task < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 5}
  validates :date, presence: true
  belongs_to :category
end
