class CurrenciesController < ApplicationController
  def bitcoin
    render json: {
      currencies: Currency.bitcoin.period(params['period']),
      meta: {
        type: 'bitcoin',
        label: I18n.t('controllers.currencies.bitcoin.label'),
        last_week_variation: "#{Currency.bitcoin.last_week_variation}%",
        last_month_variation: "#{Currency.bitcoin.last_month_variation}%"
      }
    }
  end

  def dollar
    render json: {
      currencies: Currency.dollar.period(params['period']),
      meta: {
        type: 'dollar',
        label: I18n.t('controllers.currencies.dollar.label'),
        last_week_variation: "#{Currency.dollar.last_week_variation}%",
        last_month_variation: "#{Currency.dollar.last_month_variation}%"
      }
    }
  end

  def euro
    render json: {
      currencies: Currency.euro.period(params['period']),
      meta: {
        type: 'euro',
        label: I18n.t('controllers.currencies.euro.label'),
        last_week_variation: "#{Currency.euro.last_week_variation}%",
        last_month_variation: "#{Currency.euro.last_month_variation}%"
      }
    }
  end
end
