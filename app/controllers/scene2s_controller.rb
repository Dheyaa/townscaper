class Scene2sController < ApplicationController
  before_action :set_scene2, only: [:show, :edit, :update, :destroy]

  # GET /scene2s
  # GET /scene2s.json
  def index
    @scene2s = Scene2.all
  end

  # GET /scene2s/1
  # GET /scene2s/1.json
  def show
  end

  # GET /scene2s/new
  def new
    @scene2 = Scene2.new
  end

  # GET /scene2s/1/edit
  def edit
  end

  # POST /scene2s
  # POST /scene2s.json
  def create
    @scene2 = Scene2.new(scene2_params)

    respond_to do |format|
      if @scene2.save
        format.html { redirect_to @scene2, notice: 'Scene2 was successfully created.' }
        format.json { render :show, status: :created, location: @scene2 }
      else
        format.html { render :new }
        format.json { render json: @scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene2s/1
  # PATCH/PUT /scene2s/1.json
  def update
    respond_to do |format|
      if @scene2.update(scene2_params)
        format.html { redirect_to @scene2, notice: 'Scene2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene2 }
      else
        format.html { render :edit }
        format.json { render json: @scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene2s/1
  # DELETE /scene2s/1.json
  def destroy
    @scene2.destroy
    respond_to do |format|
      format.html { redirect_to scene2s_url, notice: 'Scene2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene2
      @scene2 = Scene2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene2_params
      params.require(:scene2).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
