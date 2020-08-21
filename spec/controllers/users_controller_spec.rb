require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    it 'returns json token' do
      get :create, params: { 'user': { 'email': 'test@test.com',
                                       'password': 'mypassword' } }
      res = JSON.parse(response.body)
      expect(res['token']).to be_kind_of(String)
    end

    it 'returns error blank email' do
      get :create, params: { 'user': { 'email': '',
                                       'password': 'mypassword' } }
      res = JSON.parse(response.body)
      expect(res['email']).to eq(["can't be blank"])
    end

    it 'returns error blank password' do
      get :create, params: { 'user': { 'email': 'test@test.com',
                                       'password': '' } }
      res = JSON.parse(response.body)
      expect(res['password']).to eq(["can't be blank"])
    end
  end

  describe 'signin' do
    it 'returns token' do
      user = FactoryBot.create(:user)
      get :signin, params: { 'user': { 'email': user.email,
                                       'password': user.password } }
      res = JSON.parse(response.body)
      expect(res['token']).to be_kind_of(String)
    end

    it 'returns error' do
      get :signin, params: { 'user': { 'email': 'test@test.com',
                                       'password': 'mypassword' } }
      res = JSON.parse(response.body)
      expect(res['error']).to eq('Invalid Request')
    end
  end
end
