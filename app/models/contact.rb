class Contact < ApplicationRecord
  belongs_to :district
  validates :name, :district_id, presence: true
end
