class Coord < ApplicationRecord
  validates :latitude, :longitude, :altitude, :accuracy, :heading, :speed, :altitudeAccuracy, presence: :true
  belongs_to :location

  def as_json(options = {})
    {
      :latitude => latitude.to_f,
      :longitude => longitude.to_f,
      :altitude => altitude.to_f,
      :accuracy => accuracy.to_f,
      :heading => heading.to_f,
      :speed => speed.to_f,
      :altitudeAccuracy => altitudeAccuracy.to_f
    }
  end
end
