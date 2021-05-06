class Vacation < ApplicationRecord
  has_many :goals
  has_many :users, through: :groups
  belongs_to :group

  validates :description, presence: true
  validates :date_traveling, presence: true

  scope :most_recent, ->(group) { where('group_id = ?', group.id).where('date_traveling >= ?', DateTime.now).order(date_traveling: :asc) }



end