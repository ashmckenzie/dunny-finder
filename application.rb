require File.join(File.dirname(__FILE__), 'bootstrap.rb') 

get '/search/postcode/:postcode' do
  content_type :json
  toilets = Town.all(:postcode => params[:postcode]).toilets.sort_by(&:name)

  json = Representative::Json.new do |r|
    r.list_of :toilets, toilets do
      r.element :name
      r.element :address
      r.element :url
      r.element :latitude
      r.element :longitude
    end
  end
  json.to_s
end

get '/search/town/:town' do
  content_type :json
  Town.first(:name => /#{params[:town]}/i).toilets.sort_by(&:name).to_json
end
