class Selection < ApplicationRecord
  belongs_to :market
  has_many :odds_snapshots, dependent: :destroy
  has_many :bets, dependent: :restrict_with_exception

  validates :label, :current_odds, presence: true
  validates :current_odds, numericality: { greater_than: 1.0 }
end
