class Chapter < ApplicationRecord
  has_many :districts, dependent: :destroy
  validates :title, presence: true
end
