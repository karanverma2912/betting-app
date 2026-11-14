class OddsSnapshot < ApplicationRecord
  belongs_to :selection
  validates :odds, numericality: { greater_than: 1.0 }
end
