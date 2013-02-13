module ApplicationHelper

  def modal_button(name, modal_target, options)
    if options.nil?
      options = {:class => "button", :'data-target' => "modal"}
    else
      options[:'data-target'] = modal_target
    end
    options[:onclick] = "showModal(this);"
    button_tag name, options
  end

end
