class CourseRepresenter
  def initialize(course)
    @course = course
  end

  def as_json
    {
      id: course.id,
      name: course.name,
      creator: course.name,
      category: course.category,
      user_id: course.user_id,
      updated_at: course.updated_at,
      created_at: course.created_at
    }
  end

  private

  attr_reader :course
end
