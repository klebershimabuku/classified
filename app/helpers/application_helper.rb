module ApplicationHelper

  def admin?
    current_user && current_user.role == 'admin'
  end

  def user?
    current_user && current_user.role == 'user'
  end

  def full_title(title)
    if title.present?
      "Carecia | #{title}"
    else
      "Carecia"
    end
  end
end
