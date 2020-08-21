require 'rails_helper'

RSpec.describe TracksController, type: :controller do
  describe 'index' do
    it 'returns error if not authorizated' do
      get :index
      res = JSON.parse(response.body)
      expect(res['error']).to eq('Not Authorizes')
      expect(response.status).to eq 401
    end

    it 'returns tracks' do
      ut = user_and_token
      request.headers.merge!({ 'Authorization' => 'Bearer ' + ut[0] })
      get :index
      res = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(res).to be_kind_of(Array)
    end
  end

  describe 'create' do
    it 'returns the created track' do
      request.headers.merge!({ 'Authorization' => 'Bearer ' + user_and_token[0] })
      post :create, params: { 'name': 'my track',
                              'locations': [{ 'timestamp': 10000000,
                                              'coords': { 'latitude': 35.24515,
                                                          'longitude': -106.67829,
                                                          'altitude': 100,
                                                          'accuracy': 100,
                                                          'heading': 100,
                                                          'speed': 100,
                                                          'altitudeAccuracy': 200 } }] }
      res = JSON.parse(response.body)
      expect(res).to be_kind_of(Object)
    end
  end
end
