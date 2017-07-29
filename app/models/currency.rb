class Currency < ActiveRecord::Base
  validates_presence_of :name, :buy, :sell, :variation

  scope :last_day, -> { where('created_at >= ?', 1.day.ago) }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago) }
  scope :daily_newest, -> {
    select("distinct on (created_date) date_trunc('day', created_at) as created_date, *")
    .order('created_date, created_at DESC')
  }
end
