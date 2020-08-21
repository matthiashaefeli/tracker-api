require 'rails_helper'
require './spec/support/authorization_helper'

RSpec.configure do |c|
  c.include AuthorizationHelper
end

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    it 'returns json token' do
      post :create, params: { 'user': { 'email': 'test@test.com',
                                        'password': 'mypassword' } }
      res = JSON.parse(response.body)
      expect(res['token']).to be_kind_of(String)
      expect(response.status).to eq 200
    end

    it 'returns error blank email' do
      post :create, params: { 'user': { 'email': '',
                                        'password': 'mypassword' } }
      res = JSON.parse(response.body)
      expect(res['email']).to eq(["can't be blank"])
      expect(response.status).to eq 400
    end

    it 'returns error blank password' do
      post :create, params: { 'user': { 'email': 'test@test.com',
                                        'password': '' } }
      res = JSON.parse(response.body)
      expect(res['password']).to eq(["can't be blank"])
      expect(response.status).to eq 400
    end
  end

  describe 'signin' do
    it 'returns token' do
      user = FactoryBot.create(:user)
      post :signin, params: { 'user': { 'email': user.email,
                                        'password': user.password } }
      res = JSON.parse(response.body)
      expect(res['token']).to be_kind_of(String)
      expect(response.status).to eq 200
    end

    it 'returns error if user does not exists' do
      post :signin, params: { 'user': { 'email': 'test@test.com',
                                        'password': 'mypassword' } }
      res = JSON.parse(response.body)
      expect(res['error']).to eq('Invalid Request')
      expect(response.status).to eq 401
    end
  end
end
