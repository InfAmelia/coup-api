class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :update]

  def index
    @challenges = Challenge.all

    # matches_hash = @challenges.map do |challenge|
    #   { created_at: pruned_created_at(match), winner: match.winner, id: match.id }
    # end

    json_response(@challenges)
  end

  # def create
  #   @challenge = Match.create!(winner: match_params[:winner])
  #
  #   if match_params[:challenge_id]
  #     @challenge.award_challenge_met(match_params[:challenge_id])
  #   end
  #
  #   @challenge.update_player_wins
  #
  #   json_response(@challenge)
  # end

  # def show
  #   json_response({ created_at: pruned_created_at(@challenge), winner: @challenge.winner })
  # end

  # def update
  #   @challenge.update(match_params)
  #   head :no_content
  # end

  private

  # lolol tennis
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  # def pruned_created_at(match)
  #   match.created_at
  #     .in_time_zone("Pacific Time (US & Canada)")
  #     .strftime("%d-%m-%y")
  # end
end
