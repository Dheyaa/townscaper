class FactorialScene3sController < ApplicationController
  before_action :set_factorial_scene3, only: [:show, :edit, :update, :destroy]

  # GET /factorial_scene3s
  # GET /factorial_scene3s.json
  def index
    @factorial_scene3s = FactorialScene3.all
  end

  # GET /factorial_scene3s/1
  # GET /factorial_scene3s/1.json
  def show
  end

  # GET /factorial_scene3s/new
  def new
    @factorial_scene3 = FactorialScene3.new
  end

  # GET /factorial_scene3s/1/edit
  def edit
  end

  # POST /factorial_scene3s
  # POST /factorial_scene3s.json
  def create
    @factorial_scene3 = FactorialScene3.new(factorial_scene3_params)

    respond_to do |format|
      if @factorial_scene3.save
        format.html { redirect_to @factorial_scene3, notice: 'Factorial scene3 was successfully created.' }
        format.json { render :show, status: :created, location: @factorial_scene3 }
      else
        format.html { render :new }
        format.json { render json: @factorial_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorial_scene3s/1
  # PATCH/PUT /factorial_scene3s/1.json
  def update
    respond_to do |format|
      if @factorial_scene3.update(factorial_scene3_params)
        format.html { redirect_to @factorial_scene3, notice: 'Factorial scene3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @factorial_scene3 }
      else
        format.html { render :edit }
        format.json { render json: @factorial_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorial_scene3s/1
  # DELETE /factorial_scene3s/1.json
  def destroy
    @factorial_scene3.destroy
    respond_to do |format|
      format.html { redirect_to factorial_scene3s_url, notice: 'Factorial scene3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factorial_scene3
      @factorial_scene3 = FactorialScene3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factorial_scene3_params
      params.require(:factorial_scene3).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
