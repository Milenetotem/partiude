class RecurringFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper

  def repeat_in_field
    repeat_in_content = select(:repeat_in, RepeatIn.to_options, {}, {:class => "expand"})
    content_tag(:div, repeat_in_content, :class => "six ")
  end

  def day_of_week_check_box(day)
    content = check_box(day)
    content += content_tag('label', DaysOfWeek.t(day.to_s))
    content_tag('div', content, :class => "three column")
  end

end