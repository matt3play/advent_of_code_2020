puts File.read("Dec6_data.txt").split("\n\n").map {|g| g.split.join.split('').uniq.length }.sum
