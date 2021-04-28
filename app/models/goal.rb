class Goal < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :vacations

    validates :amount, presense: :true
end
