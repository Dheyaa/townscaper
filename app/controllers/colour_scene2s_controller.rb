class ColourScene2sController < ApplicationController
  before_action :set_colour_scene2, only: [:show, :edit, :update, :destroy]

  # GET /colour_scene2s
  # GET /colour_scene2s.json
  def index
    @colour_scene2s = ColourScene2.all
  end

  # GET /colour_scene2s/1
  # GET /colour_scene2s/1.json
  def show
  end

  # GET /colour_scene2s/new
  def new
    @colour_scene2 = ColourScene2.new
  end

  # GET /colour_scene2s/1/edit
  def edit
  end

  # POST /colour_scene2s
  # POST /colour_scene2s.json
  def create
    @colour_scene2 = ColourScene2.new(colour_scene2_params)

    respond_to do |format|
      if @colour_scene2.save
        format.html { redirect_to @colour_scene2, notice: 'Colour scene2 was successfully created.' }
        format.json { render :show, status: :created, location: @colour_scene2 }
      else
        format.html { render :new }
        format.json { render json: @colour_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colour_scene2s/1
  # PATCH/PUT /colour_scene2s/1.json
  def update
    respond_to do |format|
      if @colour_scene2.update(colour_scene2_params)
        format.html { redirect_to @colour_scene2, notice: 'Colour scene2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @colour_scene2 }
      else
        format.html { render :edit }
        format.json { render json: @colour_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colour_scene2s/1
  # DELETE /colour_scene2s/1.json
  def destroy
    @colour_scene2.destroy
    respond_to do |format|
      format.html { redirect_to colour_scene2s_url, notice: 'Colour scene2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colour_scene2
      @colour_scene2 = ColourScene2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colour_scene2_params
      params.require(:colour_scene2).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
