class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lists = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end


#   GET show
#     assigns the requested list as @list (FAILED - 8)
#   GET new
#     assigns a new list as @list (FAILED - 9)
#   POST create
#     with valid params
#       creates a new List (FAILED - 10)
#       assigns a newly created list as @list (FAILED - 11)
#       redirects to the created list (FAILED - 12)
#     with invalid params
#       assigns a newly created but unsaved list as @list (FAILED - 13)
#       re-renders the 'new' template (FAILED - 14)
