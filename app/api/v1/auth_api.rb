class AuthApi < ApiV1
  namespace :auth do
    desc "Sign up"
    params do
      requires :name, type: String, message: I18n.t("errors.required")
      requires :email, type: String, message: I18n.t("errors.required")
      requires :phone, type: String, message: I18n.t("errors.required")
      requires :password, type: String, message: I18n.t("errors.required")
      requires :password_confirmation, type: String, same_as: :password, message: I18n.t("errors.required")
    end
    post "/signup" do
      data = valid_params(params, User::SIGN_UP_PARAMS)
      user = User.create data
      if user.valid?
        token = encode_token({user_id: user.id})
        set_cookie token
        return render_success_response(:ok, AuthFormat, {token: token, user: user}, I18n.t("success.signup"))
      else
        error!(user.errors.full_messages[0], :bad_request)
      end
    end

    desc "Sign in"
    params do
      requires :email, type: String, message: I18n.t("errors.required")
      requires :password, type: String, message: I18n.t("errors.required")
    end
    post "/signin" do
      @user = get_user_by_email
      if @user&.authenticate params[:password]
        token = encode_token({user_id: @user.id})
        set_cookie token
        return render_success_response(:ok, AuthFormat, {token: token, user: @user}, I18n.t("success.login"))
      else
        error!(I18n.t("errors.incorrect_password"), :bad_request)
      end
    end
  end
end
