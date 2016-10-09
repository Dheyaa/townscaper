class FactorialScene1sController < ApplicationController
  before_action :set_factorial_scene1, only: [:show, :edit, :update, :destroy]

  # GET /factorial_scene1s
  # GET /factorial_scene1s.json
  def index
    @factorial_scene1s = FactorialScene1.all
  end

  # GET /factorial_scene1s/1
  # GET /factorial_scene1s/1.json
  def show
  end

  # GET /factorial_scene1s/new
  def new
    @factorial_scene1 = FactorialScene1.new
  end

  # GET /factorial_scene1s/1/edit
  def edit
  end

  # POST /factorial_scene1s
  # POST /factorial_scene1s.json
  def create
    @factorial_scene1 = FactorialScene1.new(factorial_scene1_params)

    respond_to do |format|
      if @factorial_scene1.save
        format.html { redirect_to @factorial_scene1, notice: 'Factorial scene1 was successfully created.' }
        format.json { render :show, status: :created, location: @factorial_scene1 }
      else
        format.html { render :new }
        format.json { render json: @factorial_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorial_scene1s/1
  # PATCH/PUT /factorial_scene1s/1.json
  def update
    respond_to do |format|
      if @factorial_scene1.update(factorial_scene1_params)
        format.html { redirect_to @factorial_scene1, notice: 'Factorial scene1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @factorial_scene1 }
      else
        format.html { render :edit }
        format.json { render json: @factorial_scene1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorial_scene1s/1
  # DELETE /factorial_scene1s/1.json
  def destroy
    @factorial_scene1.destroy
    respond_to do |format|
      format.html { redirect_to factorial_scene1s_url, notice: 'Factorial scene1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factorial_scene1
      @factorial_scene1 = FactorialScene1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factorial_scene1_params
      params.require(:factorial_scene1).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
