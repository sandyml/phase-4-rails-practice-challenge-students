class ApplicationController < ActionController::API

 private

 def record_not_valid(invalid)
  render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
 end

 def record_not_found(invalid)
  render json: { error: "#{invalid.model} not found" }, status: :not_found
 end

end
