class VerticesScenesController < ApplicationController
  before_action :set_vertices_scene, only: [:show, :edit, :update, :destroy]

  # GET /vertices_scenes
  # GET /vertices_scenes.json
  def index
    @vertices_scenes = VerticesScene.all
  end

  # GET /vertices_scenes/1
  # GET /vertices_scenes/1.json
  def show
  end

  # GET /vertices_scenes/new
  def new
    @vertices_scene = VerticesScene.new
  end

  # GET /vertices_scenes/1/edit
  def edit
  end

  # POST /vertices_scenes
  # POST /vertices_scenes.json
  def create
    @vertices_scene = VerticesScene.new(vertices_scene_params)

    respond_to do |format|
      if @vertices_scene.save
        format.html { redirect_to @vertices_scene, notice: 'Vertices scene was successfully created.' }
        format.json { render :show, status: :created, location: @vertices_scene }
      else
        format.html { render :new }
        format.json { render json: @vertices_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vertices_scenes/1
  # PATCH/PUT /vertices_scenes/1.json
  def update
    respond_to do |format|
      if @vertices_scene.update(vertices_scene_params)
        format.html { redirect_to @vertices_scene, notice: 'Vertices scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @vertices_scene }
      else
        format.html { render :edit }
        format.json { render json: @vertices_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vertices_scenes/1
  # DELETE /vertices_scenes/1.json
  def destroy
    @vertices_scene.destroy
    respond_to do |format|
      format.html { redirect_to vertices_scenes_url, notice: 'Vertices scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vertices_scene
      @vertices_scene = VerticesScene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vertices_scene_params
      params.require(:vertices_scene).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
