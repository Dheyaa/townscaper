class PositionScene2sController < ApplicationController
  before_action :set_position_scene2, only: [:show, :edit, :update, :destroy]

  # GET /position_scene2s
  # GET /position_scene2s.json
  def index
    @position_scene2s = PositionScene2.all
  end

  # GET /position_scene2s/1
  # GET /position_scene2s/1.json
  def show
  end

  # GET /position_scene2s/new
  def new
    @position_scene2 = PositionScene2.new
  end

  # GET /position_scene2s/1/edit
  def edit
  end

  # POST /position_scene2s
  # POST /position_scene2s.json
  def create
    @position_scene2 = PositionScene2.new(position_scene2_params)

    respond_to do |format|
      if @position_scene2.save
        format.html { redirect_to @position_scene2, notice: 'Position scene2 was successfully created.' }
        format.json { render :show, status: :created, location: @position_scene2 }
      else
        format.html { render :new }
        format.json { render json: @position_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_scene2s/1
  # PATCH/PUT /position_scene2s/1.json
  def update
    respond_to do |format|
      if @position_scene2.update(position_scene2_params)
        format.html { redirect_to @position_scene2, notice: 'Position scene2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @position_scene2 }
      else
        format.html { render :edit }
        format.json { render json: @position_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_scene2s/1
  # DELETE /position_scene2s/1.json
  def destroy
    @position_scene2.destroy
    respond_to do |format|
      format.html { redirect_to position_scene2s_url, notice: 'Position scene2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_scene2
      @position_scene2 = PositionScene2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_scene2_params
      params.require(:position_scene2).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
