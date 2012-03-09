class LimitValidator < ActiveModel::EachValidator

  MAX_ATTACHMENTS = 3

  def validate_each(record, attribute, value)
    record.errors.add(attribute,"#{Constants::MAX_ATTACHMENTS} attachments per post only.") if attribute.size > Constants::MAX_ATTACHMENTS
  end  
  
end
