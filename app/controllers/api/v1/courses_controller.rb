class CoursesController < ApplicationController
  before_action :find_user
  before_action :find_course, only: %i[show update destroy]

  def index
    render json: @user.courses
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: CourseRepresenter(@course).as_json, status: :created
    else
      render json: { error: @course.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def show
    render json: CourseRepresenter(@course).as_json
  end

  def update
    if @course
      @course.update(course_params)
      render json: { message: 'Course has been Successfully Updated' }, status: :ok
    else
      render json: { error: @course.errors.full_messages.first }, status: :bad_request
    end
  end

  def destroy
    if @course
      @course.destroy
      render json: { message: 'Course has been Successfully Deleted' }, status: :ok
    else
      render json: { error: @course.errors.full_messages.first }, status: :bad_request
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :creator, :hours, :user_id, :id, :category)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
