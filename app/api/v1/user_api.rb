class UserApi < ApiV1
  namespace :user do
    before do
      authenticated
    end
  end
end
