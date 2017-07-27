class CurrenciesController < ApplicationController
  def index
    render json: Currency.all
  end
end
