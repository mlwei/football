class Event < ActiveRecord::Base
  serialize :qualifier , Hash
end
