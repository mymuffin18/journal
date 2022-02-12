class Category < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3}
    validates :description, presence: true, length: {in: 5..50}
end
