class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]

  def index
    @matches = Match.all
    json_response(@matches)
  end

  def create
    @match = Match.create!(match_params)
    update_or_create_user(match_params[:winner], match_params[:challenge_id])
    json_response(@match)
  end

  def show
    created_at = @match.created_at
      .in_time_zone("Pacific Time (US & Canada)")
      .strftime("%d-%m-%y %r")

    json_response({ created_at: created_at, winner: @match.winner })
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
end
