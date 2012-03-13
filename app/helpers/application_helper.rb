#encoding: utf-8
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

  def label_for_status(status)
    if status == 'active'
      content_tag(:span, "Ativado!", :class => 'label label-success')
    elsif status == 'pending'
      content_tag(:span, "Pendente!", :class => 'label label-warning') 
    elsif status == 'review' 
      content_tag(:span, "Revisão", :class => 'label label-warning')
    elsif status == 'expired'
      content_tagw(:span, "Expirado!", :class => 'label label-danger')
    end
  end
end
