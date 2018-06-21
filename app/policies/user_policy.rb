# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.present? && user == param_user
  end

  def create?
    user.present? && user == param_user
  end

  private

  def param_user
    record
  end
end
