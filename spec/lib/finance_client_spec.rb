require 'rails_helper'
require 'finance_client'

RSpec.describe FinanceClient do
  let(:client) { FinanceClient.new }

  describe '.new' do
    xit 'initializes client' do
      expect(client).to be_an_instance_of FinanceClient
    end
  end

  describe '#currencies', vcr: { cassette_name: 'FinanceClient/currencies'} do
    it 'returns a Hash' do
      expect(client.currencies).to be_an Hash
    end

    it 'returns Dollar currency' do
      expect(client.currencies['USD']).not_to be_empty
    end

    it 'returns Euro currency' do
      expect(client.currencies['EUR']).not_to be be_empty
    end

    it 'returns Bitcoin currency' do
      expect(client.currencies['BTC']).not_to be be_empty
    end
  end
end