class AllListsController < ApplicationController
  # lists all users words lists
  def index
    @search = List.search(params[:search])
    @lists = @search.all.uniq.paginate(:per_page => 18, :page => params[:page])
  end
end
