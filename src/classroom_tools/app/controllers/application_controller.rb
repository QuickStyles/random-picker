class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  rescue_from(ActiveRecord::RecordInvalid, with: :record_invalid)

  private

  def current_user
    if session[:school_id].present?
      @school_admin ||= School.find_by(id: session[:school_id])
    end
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user.present?
      render(json: { status: 401 }, status: 401)
    end
  end

  def record_invalid(error)
    # Use `binding.pry` to stop your program that at its location
    # and open a `pry` REPL right there. You'll have access to scope
    # of the app where `binding.pry` located.

     # It requires the gems `pry` and `pry-rails` to be installed.
    # binding.pry

     # For a ActiveRecord::InvalidRecord error, the .record
    # method returns the **model instance** that failed validation
    # and raised the error.
    invalid_record = error.record
    errors = invalid_record.errors.map do |field, message|
      {
        type: error.class.to_s,
        record_type: invalid_record.class.to_s,
        field: field,
        message: message
      }
    end

     render(
      json: { status: 422, errors: errors },
      status: 422
    )
  end
end
