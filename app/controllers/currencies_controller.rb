class CurrenciesController < ApplicationController
  def dollar
    currencies = filtered_currencies(name: 'Dollar')

    render json: {
      type: 'dollar',
      labels: currencies.map { |currency| currency.created_at_str },
      datasets: {
        label: 'Cotação Dólar R$',
        data: currencies.map { |currency| currency.buy.round(2) }
      }
    }
  end

  def euro
    currencies = filtered_currencies(name: 'Euro')

    render json: {
      type: 'euro',
      labels: currencies.map { |currency| currency.created_at_str },
      datasets: {
        label: 'Cotação Euro R$',
        data: currencies.map { |currency| currency.buy.round(2) }
      }
    }
  end

  def bitcoin
    currencies = filtered_currencies(name: 'Bitcoin')

    render json: {
      type: 'bitcoin',
      labels: currencies.map { |currency| currency.created_at_str },
      datasets: {
        label: 'Cotação Bitcoin R$',
        data: currencies.map { |currency| currency.buy.round(2) }
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
