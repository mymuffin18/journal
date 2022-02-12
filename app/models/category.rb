class Category < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3}
    validates :description, presence: true, length: {in: 5..50}

    has_many :tasks, dependent: :destroy

    def as_json(options={})
        super(include: :tasks)
    end
end
