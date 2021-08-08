# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render json: { data: User.all }
  end

  def show
    user = User.find(params[:id])

    render json: { data: user }
  end
end
