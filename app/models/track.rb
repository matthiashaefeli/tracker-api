class Track < ApplicationRecord
  belongs_to :user
  has_many :locations
  validates :name, presence: :true

  def as_json(options = {})
    json = { :name => name,
             :_id => id,
             :userId => user_id }
    json[:locations] = self.locations.as_json()
    json
  end
end
