class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  def show
    @bookmark = Bookmark.find(params[:id])
  end
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end
  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
