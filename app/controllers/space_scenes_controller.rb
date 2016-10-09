class SpaceScenesController < ApplicationController
  before_action :set_space_scene, only: [:show, :edit, :update, :destroy]

  # GET /space_scenes
  # GET /space_scenes.json
  def index
    @space_scenes = SpaceScene.all
  end

  # GET /space_scenes/1
  # GET /space_scenes/1.json
  def show
  end

  # GET /space_scenes/new
  def new
    @space_scene = SpaceScene.new
  end

  # GET /space_scenes/1/edit
  def edit
  end

  # POST /space_scenes
  # POST /space_scenes.json
  def create
    @space_scene = SpaceScene.new(space_scene_params)

    respond_to do |format|
      if @space_scene.save
        format.html { redirect_to @space_scene, notice: 'Space scene was successfully created.' }
        format.json { render :show, status: :created, location: @space_scene }
      else
        format.html { render :new }
        format.json { render json: @space_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_scenes/1
  # PATCH/PUT /space_scenes/1.json
  def update
    respond_to do |format|
      if @space_scene.update(space_scene_params)
        format.html { redirect_to @space_scene, notice: 'Space scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_scene }
      else
        format.html { render :edit }
        format.json { render json: @space_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_scenes/1
  # DELETE /space_scenes/1.json
  def destroy
    @space_scene.destroy
    respond_to do |format|
      format.html { redirect_to space_scenes_url, notice: 'Space scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_scene
      @space_scene = SpaceScene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_scene_params
      params.require(:space_scene).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
