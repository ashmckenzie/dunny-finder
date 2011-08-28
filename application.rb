require 'json'
require File.join(File.dirname(__FILE__), 'bootstrap.rb') 

get '/search/postcode/:postcode' do
  content_type :json
  Town.all(:postcode => params[:postcode]).toilets.sort_by(&:name).to_json
end

get '/search/town/:town' do
  content_type :json
  Town.first(:name => /#{params[:town]}/i).toilets.sort_by(&:name).to_json
end
