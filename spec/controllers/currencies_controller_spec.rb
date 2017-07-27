require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of currencies' do
      currency = create(:currency)
      get :index

      expect(JSON.parse(response.body).size).to eq 1
    end
  end

end
