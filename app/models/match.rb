class Match < ApplicationRecord
  validates :winner, presence: true

  after_create_commit do
    MatchCreationEventBroadcastJob.perform_later(self)
  end

  def award_challenge_met(challenge_id)
    ChallengeMet.award(self.winner, challenge_id)
  end

  def update_player_wins
    player = Player.find_or_create(self.winner)
    player.increment_wins!
  end
end
