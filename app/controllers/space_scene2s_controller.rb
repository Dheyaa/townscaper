class SpaceScene2sController < ApplicationController
  before_action :set_space_scene2, only: [:show, :edit, :update, :destroy]

  # GET /space_scene2s
  # GET /space_scene2s.json
  def index
    @space_scene2s = SpaceScene2.all
  end

  # GET /space_scene2s/1
  # GET /space_scene2s/1.json
  def show
  end

  # GET /space_scene2s/new
  def new
    @space_scene2 = SpaceScene2.new
  end

  # GET /space_scene2s/1/edit
  def edit
  end

  # POST /space_scene2s
  # POST /space_scene2s.json
  def create
    @space_scene2 = SpaceScene2.new(space_scene2_params)

    respond_to do |format|
      if @space_scene2.save
        format.html { redirect_to @space_scene2, notice: 'Space scene2 was successfully created.' }
        format.json { render :show, status: :created, location: @space_scene2 }
      else
        format.html { render :new }
        format.json { render json: @space_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_scene2s/1
  # PATCH/PUT /space_scene2s/1.json
  def update
    respond_to do |format|
      if @space_scene2.update(space_scene2_params)
        format.html { redirect_to @space_scene2, notice: 'Space scene2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_scene2 }
      else
        format.html { render :edit }
        format.json { render json: @space_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_scene2s/1
  # DELETE /space_scene2s/1.json
  def destroy
    @space_scene2.destroy
    respond_to do |format|
      format.html { redirect_to space_scene2s_url, notice: 'Space scene2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_scene2
      @space_scene2 = SpaceScene2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_scene2_params
      params.require(:space_scene2).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
