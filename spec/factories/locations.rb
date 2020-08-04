FactoryBot.define do
  factory :location do
    track_id { 1 }
    latitude { 1 }
    longitude { 1 }
    altitude { 1 }
    accuracy { 1 }
    heading { 1 }
    speed { 1 }
  end
end
