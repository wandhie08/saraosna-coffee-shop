class ArrayInput < SimpleForm::Inputs::StringInput  
  def input
    input_html_options[:type] ||= input_type    
    existing_values = Array(object.public_send(attribute_name)).map do |array_el|
      @builder.text_field(nil, input_html_options.merge(value: array_el, name: "#{object_name}[#{attribute_name}][]", class: 'form-control'))
    end      

    existing_values.push @builder.text_field(nil, input_html_options.merge(value: nil, name: "#{object_name}[#{attribute_name}][]", class: 'form-control'))
    existing_values.join.html_safe  
  end    
  
  def input_type    
    :text  
  end
end