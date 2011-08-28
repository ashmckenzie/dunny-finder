#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'bootstrap.rb') 

DataMapper.finalize
DataMapper.auto_upgrade!

doc = Nokogiri::XML(File.open(LOCAL_TOILET_XML_LOCATION))
doc.remove_namespaces!

current = 0
toilets = doc.xpath('//ToiletDetails')

toilets.each do |t|
  percent = (current * 100) / toilets.size
  $log.info "Parsing #{percent}%%\r", false

  toilet_name = t.xpath('Name').text
  address = t.xpath('Address1').text

  toilet = Toilet.first_or_create(
    {
      :name => toilet_name,
    },
    :name => toilet_name,
    :address => address,
    :latitude => t.attribute('Latitude').text,
    :longitude => t.attribute('Longitude').text,
    :url => t.attribute('ToiletURL').text
  )

  town = Town.first_or_create(
    :name => t.xpath('Town').text,
    :state => t.xpath('State').text,
    :postcode => t.xpath('Postcode').text
  )

  toilet.town = town
  toilet.save or ap toilet.errors

  current += 1
end

$log.info "Parsing COMPLETE"
