def report
  puts "Header"
  yield
  puts "Footer"
end

report do
  puts "From block"
end

# Output
=begin

Header
From block
Footer

=end
