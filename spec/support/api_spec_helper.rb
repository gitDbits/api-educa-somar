module ApiSpecHelper
  def login(params)
    @user = User.find_by_email(params.dig(:user, :email))
    token = JsonWebToken.encode(user_id: @user.id)
  end
end
