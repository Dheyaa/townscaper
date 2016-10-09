class PositionScenesController < ApplicationController
  before_action :set_position_scene, only: [:show, :edit, :update, :destroy]

  # GET /position_scenes
  # GET /position_scenes.json
  def index
    @position_scenes = PositionScene.all
  end

  # GET /position_scenes/1
  # GET /position_scenes/1.json
  def show
  end

  # GET /position_scenes/new
  def new
    @position_scene = PositionScene.new
  end

  # GET /position_scenes/1/edit
  def edit
  end

  # POST /position_scenes
  # POST /position_scenes.json
  def create
    @position_scene = PositionScene.new(position_scene_params)

    respond_to do |format|
      if @position_scene.save
        format.html { redirect_to @position_scene, notice: 'Position scene was successfully created.' }
        format.json { render :show, status: :created, location: @position_scene }
      else
        format.html { render :new }
        format.json { render json: @position_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_scenes/1
  # PATCH/PUT /position_scenes/1.json
  def update
    respond_to do |format|
      if @position_scene.update(position_scene_params)
        format.html { redirect_to @position_scene, notice: 'Position scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @position_scene }
      else
        format.html { render :edit }
        format.json { render json: @position_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_scenes/1
  # DELETE /position_scenes/1.json
  def destroy
    @position_scene.destroy
    respond_to do |format|
      format.html { redirect_to position_scenes_url, notice: 'Position scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_scene
      @position_scene = PositionScene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_scene_params
      params.require(:position_scene).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
