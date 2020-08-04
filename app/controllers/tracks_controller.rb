class TracksController < ApplicationController
  include Authorization
  before_action :authorized

  def index
    tracks = Track.where(user_id: @current_user)
    render json: tracks
  end

  def create
    begin
      track = Track.new(name: params[:name], user_id: @current_user.id)
      track.save
      location_params = JSON.parse(request.raw_post)['locations'][0]
      location = Location.new(location_params['coords'])
      location.timestamp = location_params['timestamp']
      location.track_id = track.id
      location.save
      render json: track.to_json(:include => :locations)
      # render json: { track: track, location: location }
    rescue => exception
      render json: {error: 'Invalid Request'}, status: :bad_request
    end
  end
end
