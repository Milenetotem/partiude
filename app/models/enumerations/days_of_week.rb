class DaysOfWeek < Enumeration

  associate_values(
    :sunday => :sunday.to_s,
    :monday => :monday.to_s,
    :tuesday => :tuesday.to_s,
    :wednesday => :wednesday.to_s,
    :thursday => :thursday.to_s,
    :friday => :friday.to_s,
    :saturday => :saturday.to_s
  )

end
