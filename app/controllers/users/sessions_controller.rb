# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    devise_for :users, controllers: { sessions: 'users/sessions' }
  end
end
