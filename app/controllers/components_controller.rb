# frozen_string_literal: true

class ComponentsController < ApplicationController
  # before_action :set_poster, only: %i[show edit update destroy]

  # GET /posters/new
  def new
    # TODO: make sure it is myposter
    @poster = Poster.find(params[:poster_id])
    @component = @poster.components.create
  end

  # POST /posters or /posters.json
  def create
    # @poster = Poster.new(poster_params.merge(user: current_user))
    # @poster.contributors = [Contributor.new(user: current_user, role: :owner)]
    # respond_to do |format|
    #   if @poster.save
    #     format.html { redirect_to poster_url(@poster), notice: 'Poster was successfully created.' }
    #     format.json { render :show, status: :created, location: @poster }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @poster.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /posters/1 or /posters/1.json
  def update
    # respond_to do |format|
    #   if @poster.update(poster_params)
    #     format.html { redirect_to poster_url(@poster), notice: 'Poster was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @poster }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @poster.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /posters/1 or /posters/1.json
  def destroy
    # @poster.destroy

    # respond_to do |format|
    #   format.html { redirect_to posters_url, notice: 'Poster was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_poster
  #   @poster = Poster.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  # def poster_params
  #   params.require(:poster).permit(:title, :author, :css)
  # end
end
