class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :challenge

  def self.find_or_create_and_increment(name)
    user = (find_by(name: name) || new(name: name))
    user.increment_wins!
  end

  def increment_wins!
    initial_wins = self.wins || 0
    self.update_attributes!(wins: initial_wins + 1)
  end
end
