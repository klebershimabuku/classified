class Attachment < ActiveRecord::Base

   attr_accessible :description, :file

   belongs_to :attachable, :polymorphic => true

   mount_uploader :file, FileUploader
end
