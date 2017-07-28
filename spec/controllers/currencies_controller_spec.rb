require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do

  describe "GET #dollar" do
    let!(:currency) { create(:currency, name: 'Dollar') }

    it "returns http success" do
      get :dollar

      expect(response).to have_http_status(:success)
    end

    it 'returns a list of dollar currencies' do
      get :dollar
      
      expect(JSON.parse(response.body)['currencies'].size).to eq 1
    end

    it 'returns dollar meta type' do
      get :dollar

      parsed_response = JSON.parse(response.body)

      expect(parsed_response['meta']['type']).to eq 'dollar'
    end

    it 'does not return currencies other than Dollar' do
      create(:currency, name: 'Euro')
      create(:currency, name: 'Bitcoin')

      get :dollar

      expect(JSON.parse(response.body)['currencies'].size).to eq 1
    end
  end

  describe "GET #euro" do
    let!(:currency) { create(:currency, name: 'Euro') }

    it "returns http success" do
      get :euro

      expect(response).to have_http_status(:success)
    end

    it 'returns a list of euro currencies' do
      get :euro
      
      expect(JSON.parse(response.body)['currencies'].size).to eq 1
    end

    it 'returns euro meta type' do
      get :euro

      parsed_response = JSON.parse(response.body)

      expect(parsed_response['meta']['type']).to eq 'euro'
    end

    it 'does not return currencies other than Euro' do
      create(:currency, name: 'Dollar')
      create(:currency, name: 'Bitcoin')

      get :euro

      expect(JSON.parse(response.body)['currencies'].size).to eq 1
    end
  end

  describe "GET #bitcoin" do
    let!(:currency) { create(:currency, name: 'Bitcoin') }

    it "returns http success" do
      get :bitcoin

      expect(response).to have_http_status(:success)
    end

    it 'returns a list of bitcoin currencies' do
      get :bitcoin
      
      expect(JSON.parse(response.body)['currencies'].size).to eq 1
    end

    it 'returns bitcoin meta type' do
      get :bitcoin

      parsed_response = JSON.parse(response.body)

      expect(parsed_response['meta']['type']).to eq 'bitcoin'
    end

    it 'does not return currencies other than Bitcoin' do
      create(:currency, name: 'Dollar')
      create(:currency, name: 'Euro')

      get :bitcoin

      expect(JSON.parse(response.body)['currencies'].size).to eq 1
    end
  end
end
