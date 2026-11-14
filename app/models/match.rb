class Match < ApplicationRecord
  belongs_to :sport
  has_many :markets, dependent: :destroy
  has_many :bets, dependent: :restrict_with_exception

  enum :status, { scheduled: 0, live: 1, finished: 2, cancelled: 3 }

  validates :home_team, :away_team, :starts_at, presence: true
end
