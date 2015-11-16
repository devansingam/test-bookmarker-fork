class BookmarksController < ApplicationController
  before_action :logged_in?

  def new
    @bookmark = Bookmark.new
  end

  def create
    input_params = bookmark_params
    input_params[:user_id] = current_user.id
    bookmark = Bookmark.new(input_params)
    if bookmark.save
      redirect_to bookmarks_path
    else
      render 'new'
    end
  end

  def index
    @bookmarks = Bookmark.all
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
