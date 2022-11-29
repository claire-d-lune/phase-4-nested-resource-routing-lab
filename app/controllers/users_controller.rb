class UsersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :display_error

  def show
    user = User.find(params[:id])
    render json: user, include: :items
  end

  private

  def display_error (error)
    render json: error, status: 404
  end

end
