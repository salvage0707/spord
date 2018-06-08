class Users::CommunitiesController < ApplicationController
  def show
    if @community = community.find_by(id: params[:id])
    else
      redirect_to Coommunities_path
    end
  end

  def index
  end

  def edit
  end

  def new
  end

  def destroy
  end
end
