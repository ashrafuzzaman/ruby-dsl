def report
  puts "Header"
  yield
  puts "Footer"
end

report do
  puts "Yield Data"
end
