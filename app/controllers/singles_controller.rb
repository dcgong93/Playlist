class SinglesController < ApplicationController
  def index
    @user = current_user
    @songs = Single.all.order('id DESC')
  end

  def create
    @song = Single.new(song_params)
    if @song.save
      redirect_to singles_path
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to singles_path
    end
  end

  def show
    @user = User.find(params[:id])
    @single = Single.find(params[:id])
    @users = @single.track_users.all
    @users_uniq = @users.uniq
  end

  private
    def song_params
      params.require(:single).permit(:title, :artist)
    end
end
