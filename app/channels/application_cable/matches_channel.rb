class MatchesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'matches_channel'
  end

  def unsubscribed; end

  def create(opts)
    Match.create(
      winner: opts.fetch('winner')
    )
  end
end
