class Market < ApplicationRecord
  belongs_to :match
  has_many :selections, dependent: :destroy
  has_many :bets, through: :selections

  enum :status, { open: 0, suspended: 1, settled: 2 }
  validates :name, presence: true
end
