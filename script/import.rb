require 'json'
require 'active_record'

class Country < ActiveRecord::Base ; end
class Player < ActiveRecord::Base ; end
class Match < ActiveRecord::Base ; end
class Event < ActiveRecord::Base ; end
module Import
  def self.initialize!
    ActiveRecord::Base.establish_connection(YAML::load(File.open("#{__dir__}/../config/database.yml").read)['development'])
  end
  def self.go!
    raw_data = JSON.parse(File.open("match_data/match.txt", "r").gets)
    #match
    match = Match.create(
      :weather_code => raw_data["weatherCode"],
      :stadium => raw_data["venueName"],
      :ht_score => raw_data["htScore"],
      :ft_score => raw_data["ftScore"],
      :result => raw_data["score"]
    )
    #home
    home_team = Country.create(
      :id => raw_data["home"]["teamId"],
      :name => raw_data["home"]["countryName"]
    )
    raw_data["home"]["players"].each do |p|
      Player.create(
        :id => p["playerId"],
        :country_id => raw_data["home"]["teamId"],
        :number => p["shirtNo"],
        :name => p["name"],
        :position => p["position"],
        :height => p["height"],
        :weight => p["weight"],
        :age => p["age"]
      )
    end
    #away
    away_team = Country.create(
      :id => raw_data["away"]["teamId"],
      :name => raw_data["away"]["countryName"]
    )
    raw_data["away"]["players"].each do |p|
      Player.create(
        :id => p["playerId"],
        :country_id => raw_data["away"]["teamId"],
        :number => p["shirtNo"],
        :name => p["name"],
        :position => p["position"],
        :height => p["height"],
        :weight => p["weight"],
        :age => p["age"]
      )
    end
    raw_data["events"].each do |t|
      puts t
      qualifier = ""
      t["qualifiers"].each do |i|
        qualifier += i["type"]["displayName"] + ":" + i["value"].to_s + ","
      end
      Event.create(
        :event_id => t["eventId"],
        :minute => t["minute"],
        :second => t["second"],
        :country_id => t["teamId"],
        :x_cordinate => t["x"],
        :y_cordinate => t["y"],
        :period => t["period"]["value"],
        :event_type => t["type"]["displayName"],
        :out_come_type => t["outcomeType"] ? t["outcomeType"]["displayName"] : nil,
        :qualifier => qualifier,
        :satisfied_event => t["satisfiedEventsTypes"] ? t["satisfiedEventsTypes"].join(",") : nil,
        :is_touch => t["isTouch"] ? t["isTouch"] : nil ,
        :player_id => t["playerId"] ? t["playerId"] : nil,
        :end_x_cordinate => t["endX"] ? t["endX"] : nil,
        :end_y_cordinate => t["endY"] ? t["endY"] : nil,
        :goal_mouth_z => t["goalMouthZ"] ? t["goalMouthZ"] : nil,
        :goal_mouth_y => t["goalMouthY"] ? t["goalMouthY"] : nil,
        :is_goal => t["isGoal"] ? t["isGoal"] : nil,
        :is_shoot => t["isShot"] ? t["isShot"] : nil,
        :related_event_id => t["relatedEventId"] ? t["relatedEventId"] : nil,
        :reloated_player_id => t["relatedPlayerId"] ? t["relatedPlayerId"] : nil,
        :block_x_cordinate => t["blockedX"] ? t["blockedX"] : nil,
        :block_y_cordinate => t["blockedY"] ? t["blockedY"] : nil,
        :card_type => t["cardType"] ? t["cardType"]["displayName"] : nil
      )
    end
  end
end

Import.initialize!
Import.go!