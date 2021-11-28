class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  def create?
    user
  end

  private

  def owner?
    @user == @record.user
  end

  def admin?
    @user.role == 'admin'
  end
end
