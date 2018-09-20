module ApplicationHelper
  def display_object_field_errors(object, field)
    if object.errors[field].any?
      content_tag('div', class: 'text-danger') do 
        "#{field.to_s.titleize} #{object.errors[field].join(', ')}"
      end
    end
  end
end
