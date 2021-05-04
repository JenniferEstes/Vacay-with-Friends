class Vacation < ApplicationRecord
  belongs_to :group
  has_many :goals
  has_many :users, through: :groups

  validates :description, presence: true
  validates :date_traveling, presence: true

  scope :most_recent, ->(group) { where('group_id = ?', group.id).where('date_traveling >= ?', DateTime.now).order(date_traveling: :asc) }

  # def self.most_recent(group)
  #   self.order(updated_at: :desc).where(group_id: group.id)
  # end

end