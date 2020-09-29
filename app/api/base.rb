class Base < Grape::API
  helpers AuthHelper
  helpers LocaleHelper
  helpers ResponseHelper
  helpers ParamHelper
  helpers UserHelper

  before do
    set_locale
  end

  mount ApiV1
end
