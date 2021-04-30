class User < ApplicationRecord
    has_many :vacations
    has_many :goals
    has_many :group_goals, through: :vacations, source: :goal

    #gives password validation
    #gives reader and writer methods
    #gives authenticate method
    has_secure_password

    validates :email, uniqueness: true
    validates :email, :group_name, :group_members, :first_name, :last_name, presence: true
    validates :password, length: { in: 3...16 }
end