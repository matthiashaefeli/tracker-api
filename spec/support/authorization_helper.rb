module AuthorizationHelper
  def auth_tokens_for_user(user)
    post :signin, params: { user: { email: user.email,
                                   password: user.password } }
    res = JSON.parse(response.body)
    res['token']
  end

  def user_and_token
    @controller = UsersController.new
    user = FactoryBot.create(:user)
    token = auth_tokens_for_user(user)
    @controller = TracksController.new
    [token, user]
  end
end