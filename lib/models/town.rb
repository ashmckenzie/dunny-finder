class Town
  include DataMapper::Resource
  has n, :toilets, :order => [ :name.asc ]
  property :id, Serial
  property :name, String, :length => 255
  property :state, String
  property :postcode, String
  timestamps :at
end
