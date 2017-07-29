class CurrenciesController < ApplicationController
  def dollar
    render json: {
      currencies: filtered_currencies(name: 'Dollar'),
      meta: {
        type: 'dollar',
        label: I18n.t('controllers.currencies.dollar.label')
      }
    }
  end

  def euro
    render json: {
      currencies: filtered_currencies(name: 'Euro'),
      meta: {
        type: 'euro',
        label: I18n.t('controllers.currencies.euro.label')
      }
    }
  end

  def bitcoin
    render json: {
      currencies: filtered_currencies(name: 'Bitcoin'),
      meta: {
        type: 'bitcoin',
        label: I18n.t('controllers.currencies.bitcoin.label')
      }
    }
  end

  private

  def filtered_currencies(attributes)
    return Currency.where(attributes)
                   .last_month
                   .group("DATE(created_at)") if params['filter'] == 'last_month'
    Currency.where(attributes).last_day
  end
end
