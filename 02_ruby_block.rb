def report(data)
  puts "Header"

  yield
  data.each do |row|
    puts row[:name]
  end

  puts "Footer"
end

data = [
  {name: 'Jitu'},
  {name: 'Razeen'}
]

report(data) do
  puts "reached yield"
end
