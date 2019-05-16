# This controller is inheriting from our ApplicationController
class Api::V1::SchoolsController < ApplicationController
  def index
    schools = School.all()
    normalized_schools = schools.map { |s|
      {
        name: s.name,
        location: s.location,
        account_id: s.account_id,
        email: s.email
      }
    }
    render json: {schools: normalized_schools}
  end

  def show
    normalize_school = {
      name: school.name,
      location: school.location,
      account_id: school.account_id,
      email: school.email
    }
    render json: {school: school}
  end

  def create

  end

  def destroy
    if()
  end

  private

  def school_params
    params.require(:school).permit(:name, :location, :password, :password_confirmation, :account_id, :email)
  end

  def school
    School.find params[:id]
  end
end
