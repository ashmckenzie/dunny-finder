require File.join(File.dirname(__FILE__), 'lib', 'bootstrap.rb')

class DF < Thor
  desc "parse", "Parse Toilet XML file"
  def parse
    d = DunnyFinder.new
    d.parse_xml
  end

  desc "update", "Update XML from the Internet"
  def update
    d = DunnyFinder.new
    d.update_xml
  end
end
