valid_count = 0
req_keys = ['byr','iyr','eyr','hgt','ecl','hcl','pid'].sort!

batch = File.read("Dec4_data.txt").split("\n\n").each do |doc|
  doc_keys = doc.split.map {|d| d.split(':').first}
  doc_keys.delete('cid')
  doc_keys.sort!

  valid_count += 1 if doc_keys == req_keys
end

puts valid_count
