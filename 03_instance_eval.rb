class Report
  def initialize(&block)
    puts "Header"
    instance_eval &block if block_given?
    puts "Footer"
  end
end

Report.new() do
  puts "From block"
end


# Output
=begin

Header
From block
Footer

=end
