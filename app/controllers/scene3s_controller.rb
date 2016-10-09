class Scene3sController < ApplicationController
  before_action :set_scene3, only: [:show, :edit, :update, :destroy]

  # GET /scene3s
  # GET /scene3s.json
  def index
    @scene3s = Scene3.all
  end

  # GET /scene3s/1
  # GET /scene3s/1.json
  def show
  end

  # GET /scene3s/new
  def new
    @scene3 = Scene3.new
  end

  # GET /scene3s/1/edit
  def edit
  end

  # POST /scene3s
  # POST /scene3s.json
  def create
    @scene3 = Scene3.new(scene3_params)

    respond_to do |format|
      if @scene3.save
        format.html { redirect_to @scene3, notice: 'Scene3 was successfully created.' }
        format.json { render :show, status: :created, location: @scene3 }
      else
        format.html { render :new }
        format.json { render json: @scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene3s/1
  # PATCH/PUT /scene3s/1.json
  def update
    respond_to do |format|
      if @scene3.update(scene3_params)
        format.html { redirect_to @scene3, notice: 'Scene3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene3 }
      else
        format.html { render :edit }
        format.json { render json: @scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene3s/1
  # DELETE /scene3s/1.json
  def destroy
    @scene3.destroy
    respond_to do |format|
      format.html { redirect_to scene3s_url, notice: 'Scene3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene3
      @scene3 = Scene3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene3_params
      params.require(:scene3).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
