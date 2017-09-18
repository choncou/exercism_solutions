class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    @students[grade] = [] unless @students[grade]
    @students[grade] << name
  end

  def students(grade)
    @students.fetch(grade, []).sort
  end

  def students_by_grade
    @students.sort { |x, y| x[0] <=> y[0] }.map { |k| { grade: k[0], students: k[1].sort } }
  end
end

module BookKeeping
  VERSION = 3
end
