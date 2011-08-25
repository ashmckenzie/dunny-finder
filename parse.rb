#!/usr/bin/env ruby

require 'yaml'
require 'bundler/setup'
Bundler.require(:default)

require_relative './lib/database'

data = './data/ToiletmapExport.xml'

doc = Nokogiri::XML(File.open(data))
doc.remove_namespaces!

#Toilet.destroy_all
#Town.destroy_all

doc.xpath('//ToiletDetails').each do |t|
  toilet_name = t.xpath('Name').text
  address = t.xpath('Address1').text
  town = Town.first_or_create(
    :name => t.xpath('Town').text,
    :state => t.xpath('State').text,
    :postcode => t.xpath('Postcode').text
  )
  toilet = Toilet.first_or_new(
    :name => toilet_name,
    :address => address,
    :latitude => t.attribute('Latitude').text,
    :longitude => t.attribute('Longitude').text,
    :url => t.attribute('ToiletURL').text,
  )
  toilet.town = town
  unless toilet.new?
    puts "> Toilet '#{toilet_name}' - '#{address}' already exist.."
    next
  end
  toilet.save!
end
