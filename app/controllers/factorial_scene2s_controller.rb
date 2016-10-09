class FactorialScene2sController < ApplicationController
  before_action :set_factorial_scene2, only: [:show, :edit, :update, :destroy]

  # GET /factorial_scene2s
  # GET /factorial_scene2s.json
  def index
    @factorial_scene2s = FactorialScene2.all
  end

  # GET /factorial_scene2s/1
  # GET /factorial_scene2s/1.json
  def show
  end

  # GET /factorial_scene2s/new
  def new
    @factorial_scene2 = FactorialScene2.new
  end

  # GET /factorial_scene2s/1/edit
  def edit
  end

  # POST /factorial_scene2s
  # POST /factorial_scene2s.json
  def create
    @factorial_scene2 = FactorialScene2.new(factorial_scene2_params)

    respond_to do |format|
      if @factorial_scene2.save
        format.html { redirect_to @factorial_scene2, notice: 'Factorial scene2 was successfully created.' }
        format.json { render :show, status: :created, location: @factorial_scene2 }
      else
        format.html { render :new }
        format.json { render json: @factorial_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorial_scene2s/1
  # PATCH/PUT /factorial_scene2s/1.json
  def update
    respond_to do |format|
      if @factorial_scene2.update(factorial_scene2_params)
        format.html { redirect_to @factorial_scene2, notice: 'Factorial scene2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @factorial_scene2 }
      else
        format.html { render :edit }
        format.json { render json: @factorial_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorial_scene2s/1
  # DELETE /factorial_scene2s/1.json
  def destroy
    @factorial_scene2.destroy
    respond_to do |format|
      format.html { redirect_to factorial_scene2s_url, notice: 'Factorial scene2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factorial_scene2
      @factorial_scene2 = FactorialScene2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factorial_scene2_params
      params.require(:factorial_scene2).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
