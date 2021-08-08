# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :find_user, only: %i[index]

  def index
    render json: { data: @user.lists }
  end

  def update
    list = List.find(params[:id])

    if list.update(list_params)
      render json: { data: list }
    else
      render json: { message: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
