class CurrenciesController < ApplicationController
  def dollar
    render json: {
      currencies: Currency.where(name: 'Dollar').period(params['period']),
      meta: {
        type: 'dollar',
        label: I18n.t('controllers.currencies.dollar.label')
      }
    }
  end

  def euro
    render json: {
      currencies: Currency.where(name: 'Euro').period(params['period']),
      meta: {
        type: 'euro',
        label: I18n.t('controllers.currencies.euro.label')
      }
    }
  end

  def bitcoin
    render json: {
      currencies: Currency.where(name: 'Bitcoin').period(params['period']),
      meta: {
        type: 'bitcoin',
        label: I18n.t('controllers.currencies.bitcoin.label')
      }
    }
  end
end
