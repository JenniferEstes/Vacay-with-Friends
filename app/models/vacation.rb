class Vacation < ApplicationRecord
  belongs_to :user
  has_many :goals

  validates :description, presence: true
  validates :date_traveling, presence: true

end