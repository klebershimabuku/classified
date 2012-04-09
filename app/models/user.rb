  class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :posts, dependent: :destroy

  after_create :send_admin_notification

  def send_admin_notification
    Mailer.send_admin_notification(self.email).deliver
  end

  def feed
    Post.where("user_id = ?", id).order('id desc')	  	
  end

  def manager!
    update_attribute(:role, "manager")
  end

  def moderator!
    update_attribute(:role, "moderator")
  end
    
  def user!
    update_attribute(:role, "user")
  end

end
