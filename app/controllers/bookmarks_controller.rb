class BookmarksController < ApplicationController
  def index
    @list = List.find(params["list_id"])
    @bookmarks = Bookmark.where('list_id = ?', @list.id)
  end

  def new
    @list = List.find(params["list_id"])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @list = List.find(params["list_id"])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params["id"])
    @list = @bookmark.list
    @bookmark.destroy
    @bookmark.save
    redirect_to list_path(@list)
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def bookmark_params2
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
