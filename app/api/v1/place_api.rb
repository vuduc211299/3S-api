class PlaceApi < ApiV1
  namespace :place do
    before do
      authenticated
    end

    desc "Add a place"
    params do
      requires :name, :details, :address, type: String, message: I18n.t("messages.errors.required")
      requires :city, type: Symbol, values: [:hanoi, :hcm, :danang, :nhatrang, :dalat, :quangninh, :hoian, :vungtau]
      requires :place_type, type: Symbol, values: [:homestay, :villa, :apartment, :penhouse, :hostel, :motel]
      requires :overviews_attributes, type: Array, message: I18n.t("messages.errors.required")
      requires :policy_attributes, type: Hash do
        requires :currency, type: Symbol, values: [:vnd, :usd, :yen]
        requires :cancel_policy, type: Symbol, values: [:normal, :flexible, :strict]
        requires :max_num_of_people, type: Integer
      end

      requires :rule_attributes, type: Hash do
        requires :special_rules, type: String
        requires :smoking, :pet, :cooking, :party, type: Symbol, values: [:allowed, :unallowed, :charge]
      end

      requires :room_attributes, type: Hash do
        requires :square, type: Integer
        requires :num_of_bedroom, :num_of_bed, :num_of_bathroom, :num_of_kitchen, type: Integer
      end

      requires :schedule_price_attributes, type: Hash do
        requires :normal_day_price, :weekend_price, :cleaning_price, type: Integer
      end

      requires :place_facilities_attributes, type: Array
    end
    post "/new" do
      data = valid_params params, Place::PLACE_PARAMS
      data[:user_id] = current_user.id
      data[:name] = params[:name]
      data[:details] = params[:details]
      data[:city] = params[:city]
      data[:place_type] = params[:place_type]
      data[:address] = params[:address]
      data[:overviews_attributes] = params[:overviews_attributes]
      data[:policy_attributes] = params[:policy_attributes]
      data[:rule_attributes] = params[:rule_attributes]
      data[:room_attributes] = params[:room_attributes]
      data[:schedule_price_attributes] = params[:schedule_price_attributes]
      data[:place_facilities_attributes] = params[:place_facilities_attributes]
      data[:accepted] = false

      place = Place.new data

      if place.valid?
        place.save

        return render_success_response(:ok, PlaceResFormat, {data: place}, I18n.t("messages.success.place.create"))
      end

      error!(place.errors.full_messages[0], :bad_request)
    end

    desc "Admin accept or deny owner's request"

    params do
      requires :id, :accepted, type: String
    end

    patch "/check" do
      admin_authenticated

      place = Place.find_by id: params[:id]
      result = place.update accepted: params[:accepted]

      return render_success_response(:ok, PlaceResFormat, {data: place}, I18n.t("messages.success.place.requested")) if result

      error!(place.errors.full_messages[0], :bad_request)
    end
  end
end
