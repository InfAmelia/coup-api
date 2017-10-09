class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]

  def index
    @matches = Match.all
    json_response(@matches)
  end

  def create
    @match = Match.create!(match_params)
    json_response(@match)
  end

  def show
    json_response(@match)
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
end
