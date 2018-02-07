class Visit < ApplicationRecord
  belongs_to :contact
  validates :visit_time, :description, presence: true
end
