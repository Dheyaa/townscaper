class SpaceScene1sController < ApplicationController
  before_action :set_space_scene1, only: [:show, :edit, :update, :destroy]

  # GET /space_scene1s
  # GET /space_scene1s.json
  def index
    @space_scene1s = SpaceScene1.all
  end

  # GET /space_scene1s/1
  # GET /space_scene1s/1.json
  def show
  end

  # GET /space_scene1s/new
  def new
    @space_scene1 = SpaceScene1.new
  end

  # GET /space_scene1s/1/edit
  def edit
  end

  # POST /space_scene1s
  # POST /space_scene1s.json
  def create
    @space_scene1 = SpaceScene1.new(space_scene1_params)

    respond_to do |format|
      if @space_scene1.save
        format.html { redirect_to @space_scene1, notice: 'Space scene1 was successfully created.' }
        format.json { render :show, status: :created, location: @space_scene1 }
      else
        format.html { render :new }
        format.json { render json: @space_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_scene1s/1
  # PATCH/PUT /space_scene1s/1.json
  def update
    respond_to do |format|
      if @space_scene1.update(space_scene1_params)
        format.html { redirect_to @space_scene1, notice: 'Space scene1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_scene1 }
      else
        format.html { render :edit }
        format.json { render json: @space_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_scene1s/1
  # DELETE /space_scene1s/1.json
  def destroy
    @space_scene1.destroy
    respond_to do |format|
      format.html { redirect_to space_scene1s_url, notice: 'Space scene1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_scene1
      @space_scene1 = SpaceScene1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_scene1_params
      params.require(:space_scene1).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
