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
      location = Location.new()
      location.timestamp = location_params['timestamp']
      location.track_id = track.id
      location.save
      coords = Coord.new(location_params['coords'])
      coords.location_id = location.id
      coords.save
      render json: track.as_json
    rescue => exception
      render json: {error: 'Invalid Request'}, status: :bad_request
    end
  end
end
