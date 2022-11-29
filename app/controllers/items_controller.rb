class ItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :display_error
  rescue_from ActiveRecord::RecordInvalid, with: :display_error

  def index
    if params[:user_id]
      items = User.find(params[:user_id]).items
    else 
      items = Item.all
    end
      render json: items, include: :user
  end

  def create
    item = Item.create!(item_params)
    if params[:user_id]
      item.update(user_id: params[:user_id])
    end
    render json: item, status: :created
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  private

  def display_error (error)
    render json: error, status: 404
  end

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end

  
end
