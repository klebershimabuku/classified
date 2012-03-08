class Post < ActiveRecord::Base
  before_destroy :remember_id

  attr_accessible :title, :description, :price, :attachments_attributes
  has_many :attachments, :as => :attachable, :dependent => :destroy 
  accepts_nested_attributes_for :attachments

  after_destroy :remove_id_directory, :remove_tmp_directory

  default_scope :order => 'id DESC'

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
