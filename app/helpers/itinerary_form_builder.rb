class ItineraryFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def transport_type_field
    transport_field_content =  label :transport_type
    transport_field_content += hidden_field(:transport_type, :value => object.transport_type)

    tags = content_tag("dd", tag("span", :class=>"car", :data=>{:value => TransportType::CAR}))
    tags += content_tag("dd", tag("span", :class=>"bike", :data=>{:value => TransportType::BIKE}))
    tags += content_tag("dd", tag("span", :class=>"walk", :data=>{:value => TransportType::WALK}))

    transport_field_content += content_tag("dl", tags, :class=> "sub-nav transport")

    content_tag(:div, transport_field_content, :class => "twelve  radio-selector", :data => {:target => "itinerary_transport_type"})
  end

end
