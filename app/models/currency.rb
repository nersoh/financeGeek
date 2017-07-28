class Currency < ActiveRecord::Base
  validates_presence_of :name, :buy, :sell, :variation

  scope :last_day, -> { where('created_at >= ?', 1.day.ago) }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago) }
end
