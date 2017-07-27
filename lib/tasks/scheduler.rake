require 'finance_client'

desc 'Fetch new currencies from API'
task :fetch_currencies => :environment do
  client = FinanceClient.new

  currencies = client.currencies

  # Create 'Dollar', 'Euro' and 'Bitcoin' currencies
  create_currency(currencies['USD'])
  create_currency(currencies['EUR'])
  create_currency(currencies['BTC'])
end


def create_currency(attributes)
  Currency.create!(
    name: attributes['name'],
    buy: attributes['buy'],
    sell: attributes['sell'],
    variation: attributes['variation']
  )
end