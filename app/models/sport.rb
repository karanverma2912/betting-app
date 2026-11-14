class Sport < ApplicationRecord
  has_many :matches, dependent: :restrict_with_exception
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
