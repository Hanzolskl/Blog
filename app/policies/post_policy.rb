class PostPolicy < ApplicationPolicy

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    true
  end

  def edit?
    @user.id == @post.user_id
  end

  def update?
    @user.id == @post.user_id
  end

  def destroy?
    @user.id == @post.user_id
  end
end
