class Post < ActiveRecord::Base
  before_destroy :remember_id

  attr_accessible :title, :description, :price, :attachments_attributes
  has_many :attachments, :as => :attachable, :dependent => :destroy 
  accepts_nested_attributes_for :attachments, :allow_destroy => true

  after_destroy :remove_id_directory, :remove_tmp_directory

  default_scope :order => 'id DESC'
  validates :title, :presence => true


  #
  # A new post when created is assign status 'pending' automatically
  # preventing abusive or inapropriate content to be exposed
  #
  # Return all the posts that are already marked as 'pending'
  # 
  # use: Post.pending
  # 
  def self.pending
    where("status = 'pending'")
  end

  def pending!
    update_attribute(:status, 'pending')
  end

  #
  # It is set to 'active' manually by the administrator after verifying
  # the content itself is all correctly
  #
  # Return all the posts that are already marked as 'active'
  # 
  # use: Post.active
  # 
  def self.active
    where("status = 'active'")
  end

  def activate!
    update_attribute(:status, 'active')
  end

  #
  # It is set to 'review' after the administrator verify it's content
  # and find something wrong or inappropriate to publish.
  #
  # Return all the posts that are already marked as 'review'
  # 
  # use: Post.review
  # 
  def self.review
    where("status = 'review'")
  end

  def review!
    update_attribute(:status, 'review')
  end

  #
  # Return all the posts that are already marked as 'expired'
  #
  # use: Post.expired
  # 
  def self.expired
    where("status = 'expired'")
  end

  def expire!
    update_attribute(:status, 'expired')
  end

  protected

  def remember_id
    @id = id
    @q = Attachment.where('attachable_id = ?', @id).to_a
  end

  def remove_id_directory
    @q.each do |rm_dir|
      path_to_be_deleted = "#{Rails.root}/public/uploads/attachment/file/#{rm_dir.id}"
      logger.debug path_to_be_deleted
      FileUtils.remove_dir(path_to_be_deleted, :force => true)
    end 
  end

  def remove_tmp_directory
    path_to_be_deleted = "#{Rails.root}/public/uploads/tmp"
    FileUtils.remove_dir(path_to_be_deleted, :force => true)
  end
end
