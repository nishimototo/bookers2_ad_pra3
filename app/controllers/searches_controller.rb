class SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "User"
      User.looks(params[:word], params[:search])
    else
      Book.looks(params[:word], params[:search])
    end
  end
end
