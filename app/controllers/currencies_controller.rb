class CurrenciesController < ApplicationController
  def dollar
    render json: {
      currencies: filtered_currencies(name: 'Dollar'),
      meta: {
        type: 'dollar',
        label: 'Dólar'
      }
    }
  end

  def euro
    render json: {
      currencies: filtered_currencies(name: 'Euro'),
      meta: {
        type: 'euro',
        label: 'Euro'
      }
    }
  end

  def bitcoin
    render json: {
      currencies: filtered_currencies(name: 'Bitcoin'),
      meta: {
        type: 'bitcoin',
        label: 'Bitcoin'
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
