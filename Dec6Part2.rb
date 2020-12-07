answer_count = 0

File.read("Dec6_data.txt").split("\n\n").each do |group|
  group_size = group.split.length
  group_answers = Hash.new(0)
  group.split.each do |person|
    person.split('').each do |answer|
      # group_answers[answer].present? ? group_answers[answer] += 1 : group_answers[answer] = 1
      group_answers[answer] += 1
    end
  end

  group_answers.each_value { |ans_cnt| answer_count += 1 if ans_cnt == group_size}
  puts group_size
  puts answer_count
  puts group_answers
end
