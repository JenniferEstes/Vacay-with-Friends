class Vacation < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates :description, presense: :true
end