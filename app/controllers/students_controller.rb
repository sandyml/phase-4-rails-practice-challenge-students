class StudentsController < ApplicationController
 rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid

  # CRUD 

  def index
   render json: Student.all, status: :ok
  end

  def show
    instructor = Student.find_by(id: params[:id])
    render json: instructor, status: :ok
  end

  def create
   render json: Student.create!(student_params)
  end

  # find the record we want to change 
  # change the record 
  # create a response 
  def update
   instructor = Student.find(params[:id])
   instructor.update!(instructor_params)
   render json: instructor, status: :ok
  end

  def destroy
   instructor = Student.find(params[:id])
   instructor.destroy
   head :no_content
  end
  
  private

  def record_not_valid(invalid)
   render json: { errors: invalid.record.errors.full_messages }
  end

  def record_not_found(invalid)
   render json: { error: "#{invalid.model} not found" }, status: :not_found
  end

  def student_params
   params.permit(:name, :major, :age, :instructor_id)
  end
 
end