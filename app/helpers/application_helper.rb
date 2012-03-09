module ApplicationHelper

  def admin?
    current_user.role == 'admin'
  end

  def user?
    current_user.role == 'user'
  end
end
