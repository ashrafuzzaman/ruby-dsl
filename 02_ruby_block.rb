def report
  puts "Header"
  yield 'From block'
  puts "Footer"
end

report do |var_from_block|
  puts var_from_block
end

# Output
=begin

Header
From block
Footer

=end
