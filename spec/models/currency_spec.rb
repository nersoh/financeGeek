require 'rails_helper'

RSpec.describe Currency, type: :model do
  let(:currency) { create(:currency) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :buy }
  it { should validate_presence_of :sell }
  it { should validate_presence_of :variation }

  describe '.bitcoin' do
    it 'returns bitcoin currencies' do
      bitcoin_currency = create(:currency, name: 'Bitcoin')

      expect(Currency.bitcoin).to include(bitcoin_currency)
    end

    it 'does not return dollar currencies' do
      dollar_currency = create(:currency, name: 'Dollar')

      expect(Currency.bitcoin).not_to include(dollar_currency)
    end

    it 'does not return euro currencies' do
      euro_currency = create(:currency, name: 'Euro')

      expect(Currency.bitcoin).not_to include(euro_currency)
    end
  end

  describe '.dollar' do
    it 'returns dollar currencies' do
      dollar_currency = create(:currency, name: 'Dollar')

      expect(Currency.dollar).to include(dollar_currency)
    end

    it 'does not return bitcoin currencies' do
      bitcoin_currency = create(:currency, name: 'Bitcoin')

      expect(Currency.dollar).not_to include(bitcoin_currency)
    end

    it 'does not return euro currencies' do
      euro_currency = create(:currency, name: 'Euro')

      expect(Currency.dollar).not_to include(euro_currency)
    end
  end

  describe '.euro' do
    it 'returns euro currencies' do
      euro_currency = create(:currency, name: 'Euro')

      expect(Currency.euro).to include(euro_currency)
    end

    it 'does not return bitcoin currencies' do
      bitcoin_currency = create(:currency, name: 'Bitcoin')

      expect(Currency.euro).not_to include(bitcoin_currency)
    end

    it 'does not return dollar currencies' do
      dollar_currency = create(:currency, name: 'Dollar')

      expect(Currency.euro).not_to include(dollar_currency)
    end
  end

  describe '.last_day' do
    it 'returns currencies created within a day' do
      currency_two_days_ago = create(:currency, created_at: 2.days.ago)
      currency_now = create(:currency)

      expect(Currency.last_day).to include(currency_now)
      expect(Currency.last_day).not_to include(currency_two_days_ago)
    end
  end

  describe '.last_month' do
    it 'returns currencies created within a month' do
      currency_two_months_ago = create(:currency, created_at: 2.months.ago)
      currency_now = create(:currency)

      expect(Currency.last_month).to include(currency_now)
      expect(Currency.last_month).not_to include(currency_two_months_ago)
    end
  end

  describe '.last_week' do
    it 'returns currencies created within a week' do
      currency_two_weeks_ago = create(:currency, created_at: 2.weeks.ago)
      currency_now = create(:currency)

      expect(Currency.last_week).to include(currency_now)
      expect(Currency.last_week).not_to include(currency_two_weeks_ago)
    end
  end


  describe '.last_week_variation' do
    it 'returns currency variation within a weeky' do
      currency_five_days_ago = create(:currency, created_at: 5.days.ago, buy: 3.2)
      currency_now = create(:currency, created_at: Time.now, buy: 3)

      expected_variation = (
        (currency_now.buy - currency_five_days_ago.buy) / currency_five_days_ago.buy * 100
      ).round(2)
      
      expect(Currency.last_week_variation).to eq (expected_variation)
    end
  end

  describe '.last_month_variation' do
    it 'returns currency variation within a month' do
      currency_20_days_ago = create(:currency, created_at: 20.days.ago, buy: 3.35)
      currency_now = create(:currency, created_at: Time.now, buy: 3.51)

      expected_variation = (
        (currency_now.buy - currency_20_days_ago.buy) / currency_20_days_ago.buy * 100
      ).round(2)
      
      expect(Currency.last_month_variation).to eq (expected_variation)
    end
  end
end
