require 'picky'

include Picky

$toilets_index = Picky::Index.new :toilet do
  source   { Toilet.all }
  indexing stopwords:          /\b(and|the|of|it|in|for)\b/i,
           splits_text_on:     /[\s\/\-\_\:\"\&\/]/
  category :name
  category :town_name
end

$toilets_index.reindex

$toilets = Picky::Search.new $toilets_index do
  searching stopwords:          /\b(and|the|of|it|in|for)\b/i,
            splits_text_on:     /[\s\/\-\&]+/
end