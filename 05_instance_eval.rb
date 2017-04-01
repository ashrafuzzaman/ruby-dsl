class Report
  def initialize(data, &block)
    @data = data
    @columns = []
    instance_eval &block if block_given?
  end

  def column(column_name)
    @columns << column_name
  end

  def print
    @data.each do |row|
      @columns.each do |column|
        puts row[column]
      end
    end
  end
end

data = [
  {name: 'Jitu', status: 'Married'},
  {name: 'Razeen', status: 'Single'}
]
report = Report.new(data) do
  column :name
end

report.print()

# Output
=begin

Jitu
Razeen

=end
