class Town
  include DataMapper::Resource
  has n, :toilets
  property :id, Serial
  property :name, String, :length => 255
  property :state, String
  property :postcode, String
  timestamps :at
end

class Toilet
  include DataMapper::Resource
  belongs_to :town
  property :id, Serial
  property :name, String, :length => 255
  property :address, String, :length => 255
  property :latitude, Float
  property :longitude, Float
  property :url, String, :length => 255
  timestamps :at
end
