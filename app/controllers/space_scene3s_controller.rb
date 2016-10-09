class SpaceScene3sController < ApplicationController
  before_action :set_space_scene3, only: [:show, :edit, :update, :destroy]

  # GET /space_scene3s
  # GET /space_scene3s.json
  def index
    @space_scene3s = SpaceScene3.all
  end

  # GET /space_scene3s/1
  # GET /space_scene3s/1.json
  def show
  end

  # GET /space_scene3s/new
  def new
    @space_scene3 = SpaceScene3.new
  end

  # GET /space_scene3s/1/edit
  def edit
  end

  # POST /space_scene3s
  # POST /space_scene3s.json
  def create
    @space_scene3 = SpaceScene3.new(space_scene3_params)

    respond_to do |format|
      if @space_scene3.save
        format.html { redirect_to @space_scene3, notice: 'Space scene3 was successfully created.' }
        format.json { render :show, status: :created, location: @space_scene3 }
      else
        format.html { render :new }
        format.json { render json: @space_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_scene3s/1
  # PATCH/PUT /space_scene3s/1.json
  def update
    respond_to do |format|
      if @space_scene3.update(space_scene3_params)
        format.html { redirect_to @space_scene3, notice: 'Space scene3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_scene3 }
      else
        format.html { render :edit }
        format.json { render json: @space_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_scene3s/1
  # DELETE /space_scene3s/1.json
  def destroy
    @space_scene3.destroy
    respond_to do |format|
      format.html { redirect_to space_scene3s_url, notice: 'Space scene3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_scene3
      @space_scene3 = SpaceScene3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_scene3_params
      params.require(:space_scene3).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
