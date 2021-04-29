class Goal < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :vacations

    validates :amount, presence: true
end
