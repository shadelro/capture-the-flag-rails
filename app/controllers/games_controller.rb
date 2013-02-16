# coding: UTF-8

class GamesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
    @available_users = User.all - @game.users
    @registrations = Hash[ @game.users.collect do |user|
      [user.id, Registration.find_by_game_id_and_user_id(@game.id, user.id)]
    end]
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end


  def add_user
    @game = Game.find(params[:id])
    @user = User.find_by_name(params[:user_name])
    @game.add_user!(@user)

    redirect_to @game
  end

  def remove_user
    @game = Game.find(params[:id])
    @user = User.find_by_name(params[:user_name])
    @game.remove_user!(@user)

    redirect_to @game
  end

  def start_game
    @game = Game.find(params[:id])
    respond_to do |format|
      if @game.start_game
        format.html { redirect_to @game, notice: 'Game was successfully started.' }
        format.json { head :no_content }
      end
    end
  end

  def end_game
    @game = Game.find(params[:id])
    respond_to do |format|
      if @game.end_game
        format.html { redirect_to @game, notice: 'Game was successfully ended.' }
        format.json { head :no_content }
      end
    end
  end
end
