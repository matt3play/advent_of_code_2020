seat_ids = File.read("Dec5_data.txt").split.map do |seat|
  seat.tr("FBLR", "0101").to_i(2)
end

puts seat_ids.max
