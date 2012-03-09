class Attachment < ActiveRecord::Base

  attr_accessible :description, :file

  belongs_to :attachable, :polymorphic => true

  mount_uploader :file, FileUploader

  validates :file, :limit => 3
  validates :file, :presence => true, :file_size => { :maximum => 0.5.megabytes.to_i }
end
