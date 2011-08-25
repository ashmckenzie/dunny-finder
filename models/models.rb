class Town
  include MongoMapper::Document
  key :name,    String
  key :state, String
  key :postcode, String
  many :toilets
end

class Toilet
  include MongoMapper::Document
  key :name, String
  key :address, String
  key :latitude, Float
  key :longitude, Float
  key :url, String
  timestamps!
  belongs_to :town
end
