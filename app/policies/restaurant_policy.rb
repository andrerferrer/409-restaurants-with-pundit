class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # everyone can see all restaurants
      scope.all

      # If we want to only show for a given user
      # their own restaurants, this is what we do
      # scope.where(user: user)

    end
  end

  # what about new?
  # new inherits from ApplicationPolicy

  def show?
    # Who can see a restaurant?
    # Also anyone
    true
  end

  def create?
    # Who can create a restaurant?
    # anyone!
    true
  end

  def update?
    # The same logic as destroy
    # Who can update a restaurant?
    # The owner
    user_is_owner?
  end

  def destroy?
    # Who can destroy a restaurant?
    # The owner
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.user
  end
end
