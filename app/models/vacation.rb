class Vacation < ApplicationRecord
  belongs_to :user
  belongs_to :goal
end