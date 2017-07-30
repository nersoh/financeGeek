class Currency < ActiveRecord::Base
  validates_presence_of :name, :buy, :sell, :variation

  scope :last_day, -> { where('created_at >= ?', 1.day.ago) }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago) }
  scope :period, lambda { |period|
    return last_day if period == 'last_day'
    return last_month.daily_newest if period == 'last_month'
  }
  scope :daily_newest, lambda {
    timezone_offset = Time.zone.now.formatted_offset
    select(
      "distinct on (created_date) \
       date_trunc('day', created_at::TIMESTAMPTZ AT TIME ZONE '#{timezone_offset}'::INTERVAL) \
       as created_date, *"
    ).order('created_date, created_at DESC')
  }
end
