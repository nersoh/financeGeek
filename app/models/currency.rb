class Currency < ActiveRecord::Base
  validates_presence_of :name, :buy, :sell, :variation
end
