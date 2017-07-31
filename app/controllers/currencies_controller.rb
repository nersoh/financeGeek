class CurrenciesController < ApplicationController
  def bitcoin
    currencies = Currency.bitcoin.period(params['period'])
    render json: {
      currencies: currencies,
      meta: {
        type: 'bitcoin',
        label: I18n.t('controllers.currencies.bitcoin.label'),
        last_week_variation: "#{currencies.last_week_variation}%",
        last_month_variation: "#{currencies.last_month_variation}%"
      }
    }
  end

  def dollar
    currencies = Currency.dollar.period(params['period'])
    render json: {
      currencies: currencies,
      meta: {
        type: 'dollar',
        label: I18n.t('controllers.currencies.dollar.label'),
        last_week_variation: "#{currencies.last_week_variation}%",
        last_month_variation: "#{currencies.last_month_variation}%"
      }
    }
  end

  def euro
    currencies = Currency.euro.period(params['period'])
    render json: {
      currencies: currencies,
      meta: {
        type: 'euro',
        label: I18n.t('controllers.currencies.euro.label'),
        last_week_variation: "#{currencies.last_week_variation}%",
        last_month_variation: "#{currencies.last_month_variation}%"
      }
    }
  end
end
