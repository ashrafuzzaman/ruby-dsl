class Report
  def initialize(&block)
    puts "Header"
    instance_eval &block if block_given?
    puts "Footer"
  end

  def my_print(str)
    puts str
  end
end

Report.new do
  my_print "From block"
end


# Output
=begin

Header
From block
Footer

=end
