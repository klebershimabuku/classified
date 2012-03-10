class FileCountValidator < ActiveModel::EachValidator

  def initialize(options)
    @with = options[:maximum]
    super
  end

  def validate_each(record, attribute, value)
   record.errors.add(attribute,"#{@with} attachments per post only. #{attribute['file'].size} detected.") if record.send(attribute).size > @with
    puts "attribute size = #{record.send(attribute).size}"
    puts "Constants::MAX_ATTACHMENTS = #{Constants::MAX_ATTACHMENTS}"
  end
end

class Constants
  MAX_ATTACHMENTS = 1
end
