class UserApi < ApiV1
  namespace :user do
    before do
      authenticated
    end

    desc "Update profile"
    params do
      optional :name, type: String, allow_blank: false
      optional :phone, type: String, allow_blank: false, 
        regexp: {value: /[0-9]{10,11}/, message: I18n.t("messages.errors.invalid_phone_number")}
      optional :birthday, type: DateTime, allow_blank: false
      optional :avatar, type: String, allow_blank: false
      optional :address, type: String, allow_blank: false
      optional :gender, type: Integer, allow_blank: false
    end
    put "/update" do
      data = valid_params params, User::UPDATE_PROFILE_PARAMS
      if user = User.update(current_user.id, data)
        render_success_response(:ok, UserFormat, user, I18n.t("messages.success.user.updated"))
      else
        error!(I18n.t("messages.errors.update"), :bad_request)
      end
    end
  end
end
