# Client that manage requests from HQBrasil API
class FinanceClient
  include HTTParty

  base_uri 'https://api.hgbrasil.com/finance'

  def currencies
    response = self.class.get('/quotations?format=json')
    JSON.parse(response.body)['results']['currencies']
  end
end
