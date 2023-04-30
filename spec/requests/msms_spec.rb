require 'rails_helper'

RSpec.describe 'POST /api/v1/results_data.json', headers: {'Accept' => 'application/ResultAnalyzer', 'ApiToken'=> 'abc123plm','ApiVersion'=> 'V1'}, type: :request do
  let(:valid_attributes) {
    {
      subject: 'Maths',
      timestamp: Date.today,
      marks: 100
    }
  }

  context 'when the request is valid' do
    before { post '/api/v1/results_data.json', headers: {'Accept' => 'application/ResultAnalyzer', 'ApiToken'=> 'abc123plm','ApiVersion'=> 'V1'}, params: valid_attributes }

    it "have success status" do
      expect(response).to have_http_status(:success)
    end

  end

  context 'when the request is invalid' do
    before { post '/api/v1/results_data.json', headers: {'Accept' => 'application/ResultAnalyzer', 'ApiToken'=> 'abc123plm','ApiVersion'=> 'V1'}, params: { subject: 'Maths' } }

    it 'returns status code 400' do
      expect(response).to have_http_status(:ok) 
    end

    it 'returns a validation failure message' do
      expect(JSON.parse(response.body)['message'])
        .to match("Unable to create Result Data, Please Try Again.")
    end
  end
end