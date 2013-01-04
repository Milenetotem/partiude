class RepeatIn < Enumeration

  associate_values(
    :today => :today.to_s,
    :daily => :daily.to_s,
    :weekly => :weekly.to_s,
    :monthly => :monthly.to_s
  )

end
