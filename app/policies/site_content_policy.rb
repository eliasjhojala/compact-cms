class SiteContentPolicy < ApplicationPolicy
  def index?; true; end
  def new?; user.admin?; end
  def create?; new?; end
  def edit?; new?; end
  def update?; edit?; end
  def destroy?; create?; end
  def order_down?; edit?; end
  def order_up?; edit?; end
end
