class Vacation < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates :description, presence: true
  validates :date_traveling, presence: true

end