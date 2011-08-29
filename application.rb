require File.join(File.dirname(__FILE__), 'bootstrap.rb') 

get '/search/postcode/:postcode' do
  content_type :json
  Toilet.json_rep Town.all(:postcode => params[:postcode]).toilets.sort_by(&:name)
end

get '/search/town/:town' do
  content_type :json
  Toilet.json_rep Town.all(:name => /#{params[:town]}/i).toilets
end
