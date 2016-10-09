class FactorialScenesController < ApplicationController
  before_action :set_factorial_scene, only: [:show, :edit, :update, :destroy]

  # GET /factorial_scenes
  # GET /factorial_scenes.json
  def index
    @factorial_scenes = FactorialScene.all
  end

  # GET /factorial_scenes/1
  # GET /factorial_scenes/1.json
  def show
  end

  # GET /factorial_scenes/new
  def new
    @factorial_scene = FactorialScene.new
  end

  # GET /factorial_scenes/1/edit
  def edit
  end

  # POST /factorial_scenes
  # POST /factorial_scenes.json
  def create
    @factorial_scene = FactorialScene.new(factorial_scene_params)

    respond_to do |format|
      if @factorial_scene.save
        format.html { redirect_to @factorial_scene, notice: 'Factorial scene was successfully created.' }
        format.json { render :show, status: :created, location: @factorial_scene }
      else
        format.html { render :new }
        format.json { render json: @factorial_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorial_scenes/1
  # PATCH/PUT /factorial_scenes/1.json
  def update
    respond_to do |format|
      if @factorial_scene.update(factorial_scene_params)
        format.html { redirect_to @factorial_scene, notice: 'Factorial scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @factorial_scene }
      else
        format.html { render :edit }
        format.json { render json: @factorial_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorial_scenes/1
  # DELETE /factorial_scenes/1.json
  def destroy
    @factorial_scene.destroy
    respond_to do |format|
      format.html { redirect_to factorial_scenes_url, notice: 'Factorial scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factorial_scene
      @factorial_scene = FactorialScene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factorial_scene_params
      params.require(:factorial_scene).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
