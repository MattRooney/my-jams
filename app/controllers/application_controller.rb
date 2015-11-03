class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :most_recent_song

  def most_recent_song
    Song.find(session[:most_recent_song_id])
  end
end
