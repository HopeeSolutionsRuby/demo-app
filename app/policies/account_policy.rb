# frozen_string_literal: true

class AccountPolicy
  attr_reader :account, :record

  def initialize(account, record)
    @account = account
    @record = record
  end

  def index?
    admin?
  end

  def show?
    admin?
  end

  # def create?
  #   false
  # end

  # def new?
  #   create?
  # end

  def update?
    admin?
  end

  def edit?
    admin?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    @account.admin?
  end
end
