class RecurringFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def repeat_in_field
    repeat_in_content = select(:repeat_in, RepeatIn.to_options.reverse, {}, {:class => "expand"})
    content_tag(:div, repeat_in_content, :class => "six columns")
  end

  def day_of_week_check_box(day)
    content = check_box(day, :value => false, :class => "left")
    content += content_tag('label', DaysOfWeek.t(day.to_s), :class => "checkbox")
    content_tag('div', content, :class => "three column invisible day_of_week")
  end

end
