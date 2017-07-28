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

  describe '#created_at_str' do
    it "returns formatted created_at (ex: 01/02/2003 20:03)" do
      expect(currency.created_at_str).to eq currency.created_at.strftime('%d/%m/%Y %H:%M')
    end
  end
end
