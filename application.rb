require 'json'
require 'awesome_print'
require_relative './bootstrap'

get '/search/postcode/:postcode' do
  content_type :json
  Town.find_by_postcode(params[:postcode]).toilets.sort_by(&:name).to_json
end

get '/search/town/:town' do
  content_type :json
  Town.first(:name => /#{params[:town]}/i).toilets.sort_by(&:name).to_json
end
