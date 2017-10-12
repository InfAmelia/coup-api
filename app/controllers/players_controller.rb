class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  def index
    @players = Player.order(wins: :desc).limit(15)
    json_response(extract_response_attributes(@players))
  end

  def create
    @player = Player.create!(player_params)
    json_response(extract_response_attributes([@player]))
  end

  def show
    json_response(extract_response_attributes([@player]))
  end

  def update
    @player.update(player_params)
    head :no_content
  end

  def destroy
    @player.destroy
    head :no_content
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    # whitelist params
    params.permit(:name)
  end

  def extract_response_attributes(players)
    players.map do |player|
      { name: player.name, wins: player.wins, challenge_ids: player.challenges_met.pluck(:id) }
    end
  end
end
