class FileReader

  attr_reader :file_data, :splitter

  def initialize(file_data, splitter)
    @file_data = file_data
    @splitter = splitter
  end

  def format
    header = []
    result = []
    file_data.split("\n").each.with_index do |line, index|
      line = line.split(splitter).map(&:strip)
      if index.zero?
        header = line
      else
        result << Hash[header.zip(line)]
      end
    end

    result
  end
end