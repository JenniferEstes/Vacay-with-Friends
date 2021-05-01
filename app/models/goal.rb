class Goal < ApplicationRecord
    belongs_to :vacation
    belongs_to :user

    validates :amount, presence: true
end
