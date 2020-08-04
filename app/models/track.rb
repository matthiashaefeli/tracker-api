class Track < ApplicationRecord
  belongs_to :user
  has_many :locations
  validates :name, presence: :true
end
