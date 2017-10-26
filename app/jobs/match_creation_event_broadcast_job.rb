class MatchCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(match)
    ActionCable
      .server
      .broadcast('matches_channel',
                 id: match.id,
                 created_at: match.created_at.strftime('%H:%M'),
                 content: match.winner)
  end
end
