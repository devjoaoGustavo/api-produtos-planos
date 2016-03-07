class ArrayInput < SimpleForm::Inputs::StringInput
  def input(_options = {})
    set_input_options
    Array(object.public_send(attribute_name)).map do |array_el|
      @builder.text_field(nil, input_html_options
        .merge(value: array_el, class: 'string required',
               name: "#{object_name}[#{attribute_name}][]"))
    end.join.html_safe
  end

  def input_type
    :text
  end

  private

  def set_input_options
    input_html_options[:type] ||= input_type
  end
end
