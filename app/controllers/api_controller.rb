# frozen_string_literal: true

class ApiController < ApplicationController
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :null_session

  before_action :authenticate_user!
  before_action :verify_user

  private

  def verify_user
    authorize User.find(params[:user_id]) if params[:user_id].present?
  end

  def user_not_authorized
    render json: { errors: 'You are not authorized for this action.' }, status: :unauthorized
  end
end
