class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :selection
  belongs_to :user, optional: true

  enum :status, { pending: 0, won: 1, lost: 2, voided: 3 }

  validates :stake, numericality: { only_integer: true, greater_than: 0 }
  validates :odds, numericality: { greater_than: 1.0 }
  validates :idempotency_key, presence: true, uniqueness: true
end
