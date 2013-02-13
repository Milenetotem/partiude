class Participation < Enumeration

  associate_values(
    :pending => :pending.to_s,
    :aproved => :aproved.to_s
  )

end
