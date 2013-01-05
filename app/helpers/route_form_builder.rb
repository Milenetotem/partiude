class RouteFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def transport_type_field
    transport_field_content =  label :transport_type
    transport_field_content += hidden_field(:transport_type)

    tags = content_tag("dd", tag("span", :class=>"car", :data=>{:value => "to_be_replaced"}))
    tags += content_tag("dd", tag("span", :class=>"bike", :data=>{:value => "to_be_replaced"}))
    tags += content_tag("dd", tag("span", :class=>"walk", :data=>{:value => "to_be_replaced"}))
    transport_field_content += content_tag("dl", tags, :class=> "sub-nav transport")

    content_tag(:div, transport_field_content, :class => "twelve columns radio-selector", :data => {:target => "route_transport_type"})
  end

  def repeat_in_field
    repeat_in_content = select(:repeat_in, RepeatIn.to_options, {}, {:class => "expand"})
    content_tag(:div, repeat_in_content, :class => "six columns")
  end
end
