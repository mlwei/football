class Event < ActiveRecord::Base
  serialize :qualifier , Array
end
