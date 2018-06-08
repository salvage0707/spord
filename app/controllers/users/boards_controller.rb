class Users::BoardsController < ApplicationController
  def show
  	if @board = Board.find_by(id: params[:id])
  	else
  		redirect_to boards_path
  	end
  end

  def index
  	@new_boards = Board.all
  end

  def edit
  end

  def new
  end
end
