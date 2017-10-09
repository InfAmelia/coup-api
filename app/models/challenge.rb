class Challenge < ApplicationRecord
  validates :name, presence: true
  belongs_to :player
end
