class TracksController < ApplicationController
  def create
    single = Single.find(params[:song_id])
    @track = Track.create(user: current_user, single: single)
    redirect_to '/singles'
  end
end
