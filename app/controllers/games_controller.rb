class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    games = Game.where(user: current_user).order(created_at: :desc)
    @page, @pagy, @games = pagy_results(games)

    respond_to do |format|
      format.html
      format.json { render json: games }
    end
  end

  def create
    word = Word.where.not(id: Game.where(user: current_user).pluck(:word_id)).sample
    game = Game.new(word: word, user: current_user)
    game.save
    redirect_to game
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
  end
end
