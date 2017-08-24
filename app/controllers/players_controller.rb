class PlayersController < ApplicationController

  def new
    if session[:user_id]
    @player = Player.new

  else
    redirect_to login_path
  end
  end

  def index
    if params[:search]
      arr = []
      Player.all.each do |p|
        if p.name.downcase.include?(params[:search].downcase)
          arr << p
        end
        @players = arr
      end
    else
      @players = Player.all
  end
end

  def create
    @player = Player.new(player_params)
    if @player.valid?
      if session[:user_id]
      @player.user = User.find(session[:user_id])
      end
      @player.save
      redirect_to players_path    #might want to redirect to User_Team_path
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find_by(user_id: session[:user_id])
  end

  def update
    @player= Player.find(params[:id])
    @player.update(player_params)
    if @player.valid?
      @player.save
      redirect_to player_path(@player)
    else
      render :edit
    end
  end

  def destroy
    @player= Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name,:shooting,:passing,:defense,:foul,:dribbling, :position)
  end

end
