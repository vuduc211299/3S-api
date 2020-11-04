class BookmarkApi < ApiV1
  namespace :bookmark do
    before do
      authenticated
    end

    desc "Bookmark place"

    params do
      requires :place_id, type: String, message: I18n.t("messages.errors.required")
    end

    post "/new" do
      data = valid_params params, Favorite::BOOKMARK_PARAMS

      data[:place_id] = params[:place_id]

      exist = current_user.favorites.find_by(place_id: params[:place_id]).present?

      error!("This place has been bookmarked", :bad_request) if exist

      bookmark = current_user.favorites.build data

      if bookmark.valid?
        bookmark.save

        return render_success_response(:ok, BookmarkResFormat, {data: bookmark}, I18n.t("messages.success.bookmark.create"))
      end

      error!(bookmark.errors.full_messages[0], :bad_request)
    end

    desc "Get all bookmarked places by User"

    get do
      bookmarks = Favorite.where user_id: current_user.id

      return render_success_response(:ok, BookmarkResFormat, {data: bookmarks}, I18n.t("messages.success.bookmark.get"))
    end

    desc "remove bookmark"

    delete "/remove" do
      data = valid_params params, Favorite::BOOKMARK_PARAMS

      bookmark = current_user.favorites.find_by place_id: params[:place_id]

      if bookmark
        bookmark.destroy

        return render_success_response(:ok, BookmarkResFormat, {data: bookmark}, I18n.t("messages.success.bookmark.remove"))
      end

      error!("Bookmark not found !", :bad_request)
    end
  end
end
