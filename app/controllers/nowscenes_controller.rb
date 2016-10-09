class NowscenesController < ApplicationController
  before_action :set_nowscene, only: [:show, :edit, :update, :destroy]

  # GET /nowscenes
  # GET /nowscenes.json
  def index
    @nowscenes = Nowscene.all
  end

  # GET /nowscenes/1
  # GET /nowscenes/1.json
  def show
  end

  # GET /nowscenes/new
  def new
    @nowscene = Nowscene.new
  end

  # GET /nowscenes/1/edit
  def edit
  end

  # POST /nowscenes
  # POST /nowscenes.json
  def create
    @nowscene = Nowscene.new(nowscene_params)

    respond_to do |format|
      if @nowscene.save
        format.html { redirect_to @nowscene, notice: 'Nowscene was successfully created.' }
        format.json { render :show, status: :created, location: @nowscene }
      else
        format.html { render :new }
        format.json { render json: @nowscene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nowscenes/1
  # PATCH/PUT /nowscenes/1.json
  def update
    respond_to do |format|
      if @nowscene.update(nowscene_params)
        format.html { redirect_to @nowscene, notice: 'Nowscene was successfully updated.' }
        format.json { render :show, status: :ok, location: @nowscene }
      else
        format.html { render :edit }
        format.json { render json: @nowscene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nowscenes/1
  # DELETE /nowscenes/1.json
  def destroy
    @nowscene.destroy
    respond_to do |format|
      format.html { redirect_to nowscenes_url, notice: 'Nowscene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nowscene
      @nowscene = Nowscene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nowscene_params
      params.require(:nowscene).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
