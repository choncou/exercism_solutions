class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.split("\n").map(&:split).map { |row| row.map(&:to_i) }
    @columns = @rows.transpose
  end
end
