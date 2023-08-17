class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end


end

# BookmarksController
#   GET new
#     assigns a new bookmark to @bookmark (FAILED - 1)
#   POST create
#     with valid params
#       creates a new bookmark (FAILED - 2)
#       assigns a newly created bookmark as @bookmark (FAILED - 3)
#       redirects to the created list (FAILED - 4)
#     with invalid params
#       assigns a newly created but unsaved bookmark as @bookmark (FAILED - 5)
#       re-renders the 'new' template or 'lists/show' (FAILED - 6)
#   DELETE destroy
#     deletes a bookmark (FAILED - 7)
