class ItineraryFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def transport_type_field
    transport_content = transport_type_component
    transport_content += driver_component
    additional_data = {:target => "itinerary_transport_type"}
    content_tag(:div, transport_content, :class => "twelve columns radio-selector", :data => additional_data)
  end

private
  def driver_component
<<<<<<< HEAD
    driver_content = check_box_tag(:can_drive, :class => "radius six", :value => false)
    driver_content += label_tag(:can_drive, I18n.t(:"participant.are_you_driving"))
    content_tag("div", driver_content, :class => "six columns checkbox driver_checkbox invisible")
=======
    driver_content = check_box_tag(:can_drive, :class => "radius ", :value => false)
    driver_content += label_tag(I18n.t("participant.are_you_driving".to_sym), :for => :can_drive)
    content_tag("div", driver_content, :class => "six columns end checkbox driver_checkbox invisible")
>>>>>>> a bunch of stuff from the skype meeting
  end

  def transport_type_component
    transport_field_content =  label :transport_type
    transport_field_content += hidden_field(:transport_type, :value => object.transport_type)
    tags = content_tag("dd", tag("span", :class=>"car", :data=>{:value => TransportType::CAR}))
    tags += content_tag("dd", tag("span", :class=>"bike", :data=>{:value => TransportType::BIKE}))
    tags += content_tag("dd", tag("span", :class=>"walk", :data=>{:value => TransportType::WALK}))
    transport_field_content += content_tag("dl", tags, :class=> "three columns sub-nav transport")
    transport_field_content
  end

end
