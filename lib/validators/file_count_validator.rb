class FileCountValidator < ActiveModel::EachValidator

  def initialize(options)
    @with = options[:maximum]
    super
  end

  def validate_each(record, attribute, value)  

   if value.kind_of?(Array)
      @count = value unless value.nil?
      @allow_upload = @count.size > @with
    end
  
  binding.pry    

   record.errors.add(attribute,"#{@with} attachments per post only. #{attribute['file'].size} detected.") if @allow_upload
  end
end

class Constants
  MAX_ATTACHMENTS = 1
end
