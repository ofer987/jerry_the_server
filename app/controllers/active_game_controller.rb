class ActiveGameController < ApplicationController
  before_action :set_user
  before_action :set_game, only: [:activate]

  def index
    game = ActiveGame.where(user: @user).first.game

    respond_to do |format|
      format.json do
        render json: {
          instructions: game.instructions.map { |i| i.command.data }
        }
      end
    end
  end

  def activate
    active_game = ActiveGame.where(user: @user).first

    if active_game
      active_game.update!(user: @user, game: @game)
    else
      ActiveGame.create!(user: @user, game: @game)
    end

    redirect_to user_games_path(@user) and return
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
