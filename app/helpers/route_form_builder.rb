class RouteFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def transport_type_field
    #   <dl class="sub-nav">
    #     <dd><a href="#" class="carro">&nbsp;</a></dd>
    #     <dd><a href="#" class="ape">&nbsp;</a></dd>
    #     <dd><a href="#" class="bicicleta">&nbsp;</a></dd>
    #   </dl>
    transport_field_content =  label :transport_type
    transport_field_content += radio_button(:transport_type, "to_be_replaced")
    car_link = link_to "", "#", :class => 'carro'
    transport_field_content += content_tag(:label, car_link, :for => "transport_type")

    transport_field_content += radio_button(:transport_type, "to_be_replaced")
    bike_link = link_to "", "#", :class => 'bicicleta'
    transport_field_content += content_tag(:label, bike_link, :for => "transport_type")

    transport_field_content += radio_button(:transport_type, "to_be_replaced", :class=>"")
    ape_link = link_to "", "#", :class => 'ape'
    transport_field_content += content_tag(:label, ape_link, :for => "transport_type")


    content = content_tag(:div, transport_field_content, :class => "six columns radio-selector")
  end

  def repeat_in_field
    ""
  end
end
