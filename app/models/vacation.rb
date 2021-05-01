class Vacation < ApplicationRecord

  has_many :goals
  has_many :users, through: :goals

  validates :description, presence: true
  validates :date_traveling, presence: true

end