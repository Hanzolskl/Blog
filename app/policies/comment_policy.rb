class CommentPolicy

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    true
  end

  def update?
    @user.id == @comment.user_id
  end

  def destroy?
    @user.id == @comment.user_id
  end
end
