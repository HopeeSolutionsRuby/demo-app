# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def index?
    can_manage_admin?
  end

  def show?
    can_manage_admin?
  end

  def new?
    can_manage_admin?
  end

  def create?
    can_manage_admin?
  end

  def edit?
    can_manage_admin?
  end

  def update?
    can_manage_admin?
  end

  def destroy?
    can_manage_admin?
  end

  private

  def can_manage_admin?
    @user.admin?
  end
end
