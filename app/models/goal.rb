class Goal < ApplicationRecord
    belongs_to :vacations
    has_many :users, through: :vacations

    validates :amount, presence: true
end
