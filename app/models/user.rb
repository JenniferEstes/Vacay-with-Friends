class User < ApplicationRecord
    has_many :vacations
    has_many :goals
    has_many :group_goals, through: :vacations, source: :goal

    has_secure_password
end