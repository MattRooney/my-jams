class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :most_recent_song, :current_user

  def most_recent_song
      @song ||= Song.find(session[:most_recent_song_id]) if session[:most_recent_song_id]
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
