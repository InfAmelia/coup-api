class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]

  def index
    @matches = Match.all

    matches_hash = @matches.map do |match|
      { created_at: pruned_created_at(match), winner: match.winner, id: match.id }
    end

    json_response(matches_hash)
  end

  def create
    @match = Match.create!(match_params)
    update_or_create_user(match_params[:winner], match_params[:challenge_id])
    json_response(@match)
  end

  def show
    json_response({ created_at: pruned_created_at(@match), winner: @match.winner })
  end

  def update
    @match.update(match_params)
    head :no_content
  end

  def destroy
    @match.destroy
    head :no_content
  end

  private

  # lolol tennis
  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    # whitelist params
    params.permit(:winner, :challenge_id)
  end

  def update_or_create_user(name, challenge)
    Player.find_or_create_and_increment(name)
  end

  def pruned_created_at(match)
    match.created_at
      .in_time_zone("Pacific Time (US & Canada)")
      .strftime("%d-%m-%y %r")
  end
end
