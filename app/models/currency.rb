class Currency < ActiveRecord::Base
  validates_presence_of :name, :buy, :sell, :variation

  scope :bitcoin, -> { where(name: 'Bitcoin') }
  scope :dollar, -> { where(name: 'Dollar') }
  scope :euro, -> { where(name: 'Euro') }
  scope :last_day, -> { where('created_at >= ?', 1.day.ago) }
  scope :last_week, -> { where('created_at >= ?', 1.week.ago) }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago) }

  scope :period, lambda { |period|
    return last_day if period == 'last_day'
    return last_week if period == 'last_week'
    return last_month if period == 'last_month'
  }

  def self.last_week_variation
    first_buy = last_week.first.buy
    last_buy = last_week.last.buy
    variation = (last_buy - first_buy) / first_buy * 100
    variation.round(2)
  end

  def self.last_month_variation
    first_buy = last_month.first.buy
    last_buy = last_month.last.buy
    variation = (last_buy - first_buy) / first_buy * 100
    variation.round(2)
  end
end
