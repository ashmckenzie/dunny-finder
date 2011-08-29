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

  def map_url
    "http://maps.google.com/maps?q=#{latitude},#{longitude}"
  end

  def self.json_rep toilets
    json = Representative::Json.new do |r|
      r.list_of :toilets, toilets do
        r.element :name
        r.element :address
        r.element :latitude
        r.element :longitude
        r.element :map_url
        r.element :town do
          r.element :name
          r.element :state
          r.element :postcode
        end
      end
    end
    json.to_s
  end
end
