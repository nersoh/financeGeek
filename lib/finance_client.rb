class FinanceClient
  BASE_URL = "https://api.hgbrasil.com/finance"

  def initialize
  end

  def currencies
    response = HTTParty.get("#{BASE_URL}/quotations?format=json")
    JSON.parse(response.body)['results']['currencies']
  end
end