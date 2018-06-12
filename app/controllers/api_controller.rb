# frozen_string_literal: true

class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session
  
  before_action :authenticate_user!
end
