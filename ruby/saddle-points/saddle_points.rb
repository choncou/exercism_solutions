class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.split("\n").map(&:split).map { |row| row.map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    [].tap do |result|

      @rows.each_with_index do |row, row_index|
        row.each_with_index do |val, col_index|
          if row.all? { |x| val >= x } && @columns[col_index].all? { |x| val <= x }
            result << [row_index, col_index]
          end
        end
      end

    end
  end
end
