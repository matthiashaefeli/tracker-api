class Location < ApplicationRecord
  belongs_to :track
  validates :latitude, :longitude, :altitude, :accuracy, :heading, :speed, presence: :true
end
