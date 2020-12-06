def valid_id? (doc)
  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  return false unless doc[:byr] =~ /^\d\d\d\d$/ && doc[:byr].to_i >= 1920 && doc[:byr].to_i <= 2002

  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  return false unless doc[:iyr] =~ /^\d\d\d\d$/ && doc[:iyr].to_i >= 2010 && doc[:iyr].to_i <= 2020

  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  return false unless doc[:eyr] =~ /^\d\d\d\d$/ && doc[:eyr].to_i >= 2020 && doc[:eyr].to_i <= 2030

  # hgt (Height) - a number followed by either cm or in:
  return false unless doc[:hgt] =~/^\d+(in|cm)$/

  # If cm, the number must be at least 150 and at most 193.
  return false if doc[:hgt] =~/cm/ && (doc[:hgt].to_i < 150 || doc[:hgt].to_i > 193)

  # If in, the number must be at least 59 and at most 76.
  return false if doc[:hgt] =~/in/ && (doc[:hgt].to_i < 59 || doc[:hgt].to_i > 76)

  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  return false unless doc[:hcl] =~ /^#[0-9a-f]{6}$/

  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  return false unless ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?doc[:ecl]

  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  return false unless doc[:pid] =~ /^\d{9}$/
  return true
end


valid_count = 0


batch = File.read("Dec4_data.txt").split("\n\n").each do |doc_str|
  doc = {}
  doc_str.split.each do |data|
    key,value = data.split(':')
    doc[key.to_sym] = value
  end
  valid_count += 1 if valid_id?(doc)
end

puts valid_count
