class Scene1sController < ApplicationController
  before_action :set_scene1, only: [:show, :edit, :update, :destroy]

  # GET /scene1s
  # GET /scene1s.json
  def index
    @scene1s = Scene1.all
  end

  # GET /scene1s/1
  # GET /scene1s/1.json
  def show
  end

  # GET /scene1s/new
  def new
    @scene1 = Scene1.new
  end

  # GET /scene1s/1/edit
  def edit
  end

  # POST /scene1s
  # POST /scene1s.json
  def create
    @scene1 = Scene1.new(scene1_params)

    respond_to do |format|
      if @scene1.save
        format.html { redirect_to @scene1, notice: 'Scene1 was successfully created.' }
        format.json { render :show, status: :created, location: @scene1 }
      else
        format.html { render :new }
        format.json { render json: @scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene1s/1
  # PATCH/PUT /scene1s/1.json
  def update
    respond_to do |format|
      if @scene1.update(scene1_params)
        format.html { redirect_to @scene1, notice: 'Scene1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene1 }
      else
        format.html { render :edit }
        format.json { render json: @scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene1s/1
  # DELETE /scene1s/1.json
  def destroy
    @scene1.destroy
    respond_to do |format|
      format.html { redirect_to scene1s_url, notice: 'Scene1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene1
      @scene1 = Scene1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene1_params
      params.require(:scene1).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
