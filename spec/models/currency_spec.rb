require 'rails_helper'

RSpec.describe Currency, type: :model do
  let(:currency) { create(:currency) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :buy }
  it { should validate_presence_of :sell }
  it { should validate_presence_of :variation }

  describe '.last_month' do
    it 'returns currencies created within a month' do
      currency_two_months_ago = create(:currency, created_at: 2.months.ago)
      currency_now = create(:currency)

      expect(Currency.last_month).not_to include(currency_two_months_ago)
    end
  end

  describe '.last_day' do
    it 'returns currencies created within a day' do
      currency_two_days_ago = create(:currency, created_at: 2.days.ago)
      currency_now = create(:currency)

      expect(Currency.last_day).not_to include(currency_two_days_ago)
    end
  end

  describe '.daily_newest' do
    it 'returns newest currency per day' do
      currency_one_day_ago = create(:currency, created_at: 1.day.ago)
      currency_one_day_ago_2 = create(:currency, created_at: 1.day.ago)
      currency_two_days_ago = create(:currency, created_at: 2.days.ago)

      expect(Currency.daily_newest.map(&:id)).to eq [currency_two_days_ago.id, currency_one_day_ago_2.id]
    end
  end
end
