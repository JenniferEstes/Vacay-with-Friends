class User < ApplicationRecord
    has_many :vacations, through: :groups
    has_many :goals
    has_and_belongs_to_many :groups

    #gives password validation
    #gives reader and writer methods
    #gives authenticate method
    has_secure_password

    validates :email, uniqueness: true
    validates :email, :group_name, :group_members, :first_name, :last_name, presence: true
    validates :password, length: { in: 3...16 }
end