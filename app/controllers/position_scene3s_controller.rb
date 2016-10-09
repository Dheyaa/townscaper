class PositionScene3sController < ApplicationController
  before_action :set_position_scene3, only: [:show, :edit, :update, :destroy]

  # GET /position_scene3s
  # GET /position_scene3s.json
  def index
    @position_scene3s = PositionScene3.all
  end

  # GET /position_scene3s/1
  # GET /position_scene3s/1.json
  def show
  end

  # GET /position_scene3s/new
  def new
    @position_scene3 = PositionScene3.new
  end

  # GET /position_scene3s/1/edit
  def edit
  end

  # POST /position_scene3s
  # POST /position_scene3s.json
  def create
    @position_scene3 = PositionScene3.new(position_scene3_params)

    respond_to do |format|
      if @position_scene3.save
        format.html { redirect_to @position_scene3, notice: 'Position scene3 was successfully created.' }
        format.json { render :show, status: :created, location: @position_scene3 }
      else
        format.html { render :new }
        format.json { render json: @position_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_scene3s/1
  # PATCH/PUT /position_scene3s/1.json
  def update
    respond_to do |format|
      if @position_scene3.update(position_scene3_params)
        format.html { redirect_to @position_scene3, notice: 'Position scene3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @position_scene3 }
      else
        format.html { render :edit }
        format.json { render json: @position_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_scene3s/1
  # DELETE /position_scene3s/1.json
  def destroy
    @position_scene3.destroy
    respond_to do |format|
      format.html { redirect_to position_scene3s_url, notice: 'Position scene3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_scene3
      @position_scene3 = PositionScene3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_scene3_params
      params.require(:position_scene3).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
