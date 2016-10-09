class PositionScene1sController < ApplicationController
  before_action :set_position_scene1, only: [:show, :edit, :update, :destroy]

  # GET /position_scene1s
  # GET /position_scene1s.json
  def index
    @position_scene1s = PositionScene1.all
  end

  # GET /position_scene1s/1
  # GET /position_scene1s/1.json
  def show
  end

  # GET /position_scene1s/new
  def new
    @position_scene1 = PositionScene1.new
  end

  # GET /position_scene1s/1/edit
  def edit
  end

  # POST /position_scene1s
  # POST /position_scene1s.json
  def create
    @position_scene1 = PositionScene1.new(position_scene1_params)

    respond_to do |format|
      if @position_scene1.save
        format.html { redirect_to @position_scene1, notice: 'Position scene1 was successfully created.' }
        format.json { render :show, status: :created, location: @position_scene1 }
      else
        format.html { render :new }
        format.json { render json: @position_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_scene1s/1
  # PATCH/PUT /position_scene1s/1.json
  def update
    respond_to do |format|
      if @position_scene1.update(position_scene1_params)
        format.html { redirect_to @position_scene1, notice: 'Position scene1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @position_scene1 }
      else
        format.html { render :edit }
        format.json { render json: @position_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_scene1s/1
  # DELETE /position_scene1s/1.json
  def destroy
    @position_scene1.destroy
    respond_to do |format|
      format.html { redirect_to position_scene1s_url, notice: 'Position scene1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_scene1
      @position_scene1 = PositionScene1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_scene1_params
      params.require(:position_scene1).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
