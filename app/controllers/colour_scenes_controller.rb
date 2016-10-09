class ColourScenesController < ApplicationController
  before_action :set_colour_scene, only: [:show, :edit, :update, :destroy]

  # GET /colour_scenes
  # GET /colour_scenes.json
  def index
    @colour_scenes = ColourScene.all
  end

  # GET /colour_scenes/1
  # GET /colour_scenes/1.json
  def show
  end

  # GET /colour_scenes/new
  def new
    @colour_scene = ColourScene.new
  end

  # GET /colour_scenes/1/edit
  def edit
  end

  # POST /colour_scenes
  # POST /colour_scenes.json
  def create
    @colour_scene = ColourScene.new(colour_scene_params)

    respond_to do |format|
      if @colour_scene.save
        format.html { redirect_to @colour_scene, notice: 'Colour scene was successfully created.' }
        format.json { render :show, status: :created, location: @colour_scene }
      else
        format.html { render :new }
        format.json { render json: @colour_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colour_scenes/1
  # PATCH/PUT /colour_scenes/1.json
  def update
    respond_to do |format|
      if @colour_scene.update(colour_scene_params)
        format.html { redirect_to @colour_scene, notice: 'Colour scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @colour_scene }
      else
        format.html { render :edit }
        format.json { render json: @colour_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colour_scenes/1
  # DELETE /colour_scenes/1.json
  def destroy
    @colour_scene.destroy
    respond_to do |format|
      format.html { redirect_to colour_scenes_url, notice: 'Colour scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colour_scene
      @colour_scene = ColourScene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colour_scene_params
      params.require(:colour_scene).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
