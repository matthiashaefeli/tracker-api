class Coord < ApplicationRecord
  validates :latitude, :longitude, :altitude, :accuracy, :heading, :speed, :altitudeAccuracy, presence: :true
  belongs_to :location

  def as_json(options = {})
    { :latitude => latitude,
             :longitude => longitude,
             :altitude => altitude,
             :accuracy => accuracy,
             :heading => heading,
             :speed => speed,
             :altitudeAccuracy => altitudeAccuracy
    }
  end
end
