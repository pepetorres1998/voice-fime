class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]

  # GET /sessions/:id
  def show; end

  # POST /sessions
  def create 
    @user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      @session = Session.new()
      @session.token = ActiveSupport::Base64.encode64(@user.name)
      @session.user_id = @user.id
 
      if @session.save
        render json: @session, status: :created, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def session_params
      params.permit(:email, :password_digest)
    end
end
