require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'json'
URL = "https://www.whoscored.com/Regions/247/Tournaments/36/Seasons/5967/Stages/15737/Show/International-FIFA-World-Cup-2018"
TARGET = ['World Cup Group Stages' , 'World Cup 1/8 Finals' , 'World Cup Quarter Finals' , 'World Cup Semi Finals' , 'World Cup Bronze Match' , 'World Cup Final']
module Spider
  def self.initialize!
    @doc = Nokogiri::HTML(open(url))
    ActiveRecord::Base.establish_connection(YAML::load(File.open("#{__dir__}/../config/database.yml").read)['development'])
  end
  def self.go!
    stages = []
    @doc.css('#breadcrumb-nav #stages option').each do |element|
      if TARGET.include? element.children.to_s
        stages << element.attr("value")
      end
    end
  end
end

Spider.initialize!
Spider.go!