class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update] # ==> allows you to delete lines in show, edit, update methods, will call set_song before doing anything else in these methods

  def index
    @songs_index = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      session[:most_recent_song_id] = @song.id
      redirect_to songs_path
      flash[:notice] = "Song created!"
    else
      flash[:errors] = @song.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      flash.now[:errors] = @song.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    Song.destroy(params[:id])
    # song = Song.find(params[:id])
    # song.destroy ==> this will also work, maybe use this when you might be affecting another table
    redirect_to songs_path
  end

  private

  def set_song # ==> pulling out repeated code below:
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
