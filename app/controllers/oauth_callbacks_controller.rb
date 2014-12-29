class OauthCallbacksController < ApplicationController
  def facebook
    @user = User.facebook_make({
      provider: request.env['omniauth.auth'][:provider],
      uid: request.env['omniauth.auth'][:uid],
      email: request.env['omniauth.auth'][:info][:email],
      facebook_token: request.env['omniauth.auth'][:credentials][:token]
    })

    login_user!(@user)
    redirect_to root_url
  end
end
