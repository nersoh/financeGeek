class Currency < ActiveRecord::Base
  validates_presence_of :name, :buy, :sell, :variation

  scope :last_day, -> { where('created_at >= ?', 1.day.ago) }
  scope :last_month, -> { where('created_at >= ?', 1.month.ago) }

  def created_at_str
    created_at.strftime('%d/%m/%Y %H:%M')
  end
end
