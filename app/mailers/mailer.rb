# app/mailers/mailer.rb
class Mailer < Devise::Mailer

  def contact_form(sender_name, from, subject, message)
    @message = message
    @from = from
    mail(:to => "Kleber Shimabuku <klebershimabuku@gmail.com>", :from => from, :subject => subject)
  end

  def send_admin_notification(email)
    @email = email
    mail(:to => "Kleber Shimabuku <klebershimabuku@gmail.com>", :from => email, :subject => "Acabei de me registrar!")
  end

end
