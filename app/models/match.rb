class Match < ApplicationRecord
  validates :winner, presence: true

  def award_challenge_met(challenge_id)
    ChallengeMet.award(self.winner, challenge_id)
  end
end
