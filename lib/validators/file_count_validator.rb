#encoding: utf-8
class FileCountValidator < ActiveModel::EachValidator

  def initialize(options)
    @with = options[:maximum]
    super
  end

  def validate_each(record, attribute, value)  
    record.errors.add(attribute,"são permitidas apenas #{@with} fotos por anúncio.") if value.size > @with
  end

end
