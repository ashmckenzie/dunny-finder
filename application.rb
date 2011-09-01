require File.join(File.dirname(__FILE__), 'lib', 'bootstrap.rb') 

get '/search/postcode/:postcode' do
  content_type :json
  cache_control :public, :max_age => 36000
  Toilet.json_rep Town.all(:postcode => params[:postcode]).toilets.sort_by { |t| [ t.town.name, t.name ] }
end

get '/search/town/:town' do
  content_type :json
  cache_control :public, :max_age => 36000
  Toilet.json_rep Town.all(:name => /#{params[:town]}/i).toilets.sort_by { |t| [ t.town.name, t.name ] }
end

get '/search/query/:query' do
  content_type :json
  cache_control :public, :max_age => 36000
  results = $toilets.search(params[:query], 100).to_hash[:allocations].collect { |x| x[4] }.flatten
  Toilet.json_rep Toilet.all(:id => results)
end
