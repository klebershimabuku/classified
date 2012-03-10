class FileCountValidator < ActiveModel::EachValidator

  def initialize(options)
    @with = options[:maximum]
    super
  end

  def validate_each(record, attribute, value)  
   record.errors.add(attribute,"#{@with} attachments per post only. #{attribute['file'].size} detected.") if value.size > @with
  end
end
