class Api::V1::SessionsController < ApplicationController

  def create
    school = School.find_by(account_id: params[:account_id])
    if school&.authenticate(params[:password])
      session[:school_id] = school.id
      render json: {id: school.id}
    else
      render(
        json: { status: 404 },
        status: 404
      )
    end
  end

  def destroy
    session[:school_id] = nil
    render(json: { status: 200 }, status: 200)
  end
end
