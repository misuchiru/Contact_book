class District < ApplicationRecord
  belongs_to :chapter
  has_many :contacts
  validates :title, :chapter_id, presence: true
end
