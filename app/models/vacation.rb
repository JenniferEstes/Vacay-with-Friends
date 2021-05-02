class Vacation < ApplicationRecord
  belongs_to :group
  has_many :goals
  has_many :users, through: :groups

  validates :description, presence: true
  validates :date_traveling, presence: true

end