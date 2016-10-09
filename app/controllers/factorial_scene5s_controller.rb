class FactorialScene5sController < ApplicationController
  before_action :set_factorial_scene5, only: [:show, :edit, :update, :destroy]

  # GET /factorial_scene5s
  # GET /factorial_scene5s.json
  def index
    @factorial_scene5s = FactorialScene5.all
  end

  # GET /factorial_scene5s/1
  # GET /factorial_scene5s/1.json
  def show
  end

  # GET /factorial_scene5s/new
  def new
    @factorial_scene5 = FactorialScene5.new
  end

  # GET /factorial_scene5s/1/edit
  def edit
  end

  # POST /factorial_scene5s
  # POST /factorial_scene5s.json
  def create
    @factorial_scene5 = FactorialScene5.new(factorial_scene5_params)

    respond_to do |format|
      if @factorial_scene5.save
        format.html { redirect_to @factorial_scene5, notice: 'Factorial scene5 was successfully created.' }
        format.json { render :show, status: :created, location: @factorial_scene5 }
      else
        format.html { render :new }
        format.json { render json: @factorial_scene5.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorial_scene5s/1
  # PATCH/PUT /factorial_scene5s/1.json
  def update
    respond_to do |format|
      if @factorial_scene5.update(factorial_scene5_params)
        format.html { redirect_to @factorial_scene5, notice: 'Factorial scene5 was successfully updated.' }
        format.json { render :show, status: :ok, location: @factorial_scene5 }
      else
        format.html { render :edit }
        format.json { render json: @factorial_scene5.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorial_scene5s/1
  # DELETE /factorial_scene5s/1.json
  def destroy
    @factorial_scene5.destroy
    respond_to do |format|
      format.html { redirect_to factorial_scene5s_url, notice: 'Factorial scene5 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factorial_scene5
      @factorial_scene5 = FactorialScene5.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factorial_scene5_params
      params.require(:factorial_scene5).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
