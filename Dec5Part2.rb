seat_ids = File.read("Dec5_data.txt").split.map do |seat|
  seat.tr("FBLR", "0101").to_i(2)
end

seat_ids.sort!

seat_ids.each_with_index do |seat,i|
  if seat_ids[i+1] != seat + 1
    puts seat + 1
    break
  end
end
