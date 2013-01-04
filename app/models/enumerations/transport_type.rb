class TransportType < Enumeration

  associate_values(
    :bike => :bike.to_s,
    :walk => :walk.to_s,
    :car => :car.to_s
  )

end
