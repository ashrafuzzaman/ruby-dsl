class Column
  attr_accessor :key, :title, :footer
  def initialize(key, options={})
    @key = key
    @title = options[:title] || key.capitalize
    @footer = options[:footer]
  end
end

class Report
  def initialize(data, &block)
    @data = data
    @columns = []
    instance_eval &block if block_given?
  end

  def column(key, options={})
    @columns << Column.new(key, options)
  end

  def print
    puts @columns.map { |column| column.title }.join(', ')
    @data.each do |row|
      puts @columns.map { |column| row[column.key] }.join(', ')
    end
    print_footer
  end

  def print_footer
    if @columns.any? { |column| column.footer }
      puts '=' * 20
      footers = @columns.map do |column|
        if column.footer
          values = @data.map do |row|
            row[column.key]
          end
          values.inject{ |sum, el| sum + el }.to_f / values.size
        else
          ''
        end
      end
      puts footers.join(', ')
    end
  end
end

data = [
  {name: 'Jitu', status: 'Married', age: 33},
  {name: 'Razeen', status: 'Single', age: 2}
]
report = Report.new(data) do
  column :name, title: 'Nick name'
  column :age, footer: :avg
end

report.print()

# Output
=begin

Jitu
Razeen

=end
