module ApplicationHelper

  def define_home
    if user_signed_in?
      posts_path
    else
      root_path
    end
  end

end
