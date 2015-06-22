class Event < ActiveRecord::Base
  belongs_to :provider

  validates_presence_of :name
end
