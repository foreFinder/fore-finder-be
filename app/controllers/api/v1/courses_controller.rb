class Api::V1::CoursesController < ApplicationController
  def index
    # courses = Course.all
    # courses = CoursesFacade.courses_by_state("CO")
    render json: CourseSerializer.new(courses)
  end
end
