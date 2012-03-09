class LimitValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value)
    
    #record.errors.add(attribute,"3 attachments per post only.") if attribute.size >= value
    puts "Debug size: #{attribute.size.inspect}"
    puts "Debug value: #{value.inspect}"
  end  
  
end
