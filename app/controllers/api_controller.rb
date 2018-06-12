# frozen_string_literal: true

class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session
 
  before_action :authenticate_user!
  before_action :verify_user

  private

  def verify_user
    authorize User.find(params[:user_id]) if params[:user_id].present?
  end
end
