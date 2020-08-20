class Location < ApplicationRecord
  belongs_to :track
  has_one :coord

  def as_json(options = {})
    json = { :_id => id.to_s,
             :timestamp => timestamp }
    json[:coords] = self.coord.as_json()
    json
  end
end
