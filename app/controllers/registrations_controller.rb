class RegistrationsController < ApplicationController
  def create
    Registration.create(params[:game_id], params[:user_id])
  end

  def destroy
    registration = Registration.find(params[:id])
    @game = Game.find(registration.game_id)
    registration.delete
    redirect_to @game
  end
end