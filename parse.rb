#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'bootstrap.rb') 
require 'yaml'

data = './data/ToiletmapExport.xml'

doc = Nokogiri::XML(File.open(data))
doc.remove_namespaces!

Toilet.destroy_all
Town.destroy_all

doc.xpath('//ToiletDetails').each do |t|

  toilet_name = t.xpath('Name').text
  address = t.xpath('Address1').text

  toilet = Toilet.first_or_new(
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
  toilet.save!
end
