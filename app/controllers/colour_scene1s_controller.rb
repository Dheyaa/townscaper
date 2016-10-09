class ColourScene1sController < ApplicationController
  before_action :set_colour_scene1, only: [:show, :edit, :update, :destroy]

  # GET /colour_scene1s
  # GET /colour_scene1s.json
  def index
    @colour_scene1s = ColourScene1.all
  end

  # GET /colour_scene1s/1
  # GET /colour_scene1s/1.json
  def show
  end

  # GET /colour_scene1s/new
  def new
    @colour_scene1 = ColourScene1.new
  end

  # GET /colour_scene1s/1/edit
  def edit
  end

  # POST /colour_scene1s
  # POST /colour_scene1s.json
  def create
    @colour_scene1 = ColourScene1.new(colour_scene1_params)

    respond_to do |format|
      if @colour_scene1.save
        format.html { redirect_to @colour_scene1, notice: 'Colour scene1 was successfully created.' }
        format.json { render :show, status: :created, location: @colour_scene1 }
      else
        format.html { render :new }
        format.json { render json: @colour_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colour_scene1s/1
  # PATCH/PUT /colour_scene1s/1.json
  def update
    respond_to do |format|
      if @colour_scene1.update(colour_scene1_params)
        format.html { redirect_to @colour_scene1, notice: 'Colour scene1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @colour_scene1 }
      else
        format.html { render :edit }
        format.json { render json: @colour_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colour_scene1s/1
  # DELETE /colour_scene1s/1.json
  def destroy
    @colour_scene1.destroy
    respond_to do |format|
      format.html { redirect_to colour_scene1s_url, notice: 'Colour scene1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colour_scene1
      @colour_scene1 = ColourScene1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colour_scene1_params
      params.require(:colour_scene1).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
