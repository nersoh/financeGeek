class Currency < ActiveRecord::Base
  validates_presence_of :dollar, :euro, :bitcoin
end
