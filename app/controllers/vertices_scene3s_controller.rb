class VerticesScene3sController < ApplicationController
  before_action :set_vertices_scene3, only: [:show, :edit, :update, :destroy]

  # GET /vertices_scene3s
  # GET /vertices_scene3s.json
  def index
    @vertices_scene3s = VerticesScene3.all
  end

  # GET /vertices_scene3s/1
  # GET /vertices_scene3s/1.json
  def show
  end

  # GET /vertices_scene3s/new
  def new
    @vertices_scene3 = VerticesScene3.new
  end

  # GET /vertices_scene3s/1/edit
  def edit
  end

  # POST /vertices_scene3s
  # POST /vertices_scene3s.json
  def create
    @vertices_scene3 = VerticesScene3.new(vertices_scene3_params)

    respond_to do |format|
      if @vertices_scene3.save
        format.html { redirect_to @vertices_scene3, notice: 'Vertices scene3 was successfully created.' }
        format.json { render :show, status: :created, location: @vertices_scene3 }
      else
        format.html { render :new }
        format.json { render json: @vertices_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vertices_scene3s/1
  # PATCH/PUT /vertices_scene3s/1.json
  def update
    respond_to do |format|
      if @vertices_scene3.update(vertices_scene3_params)
        format.html { redirect_to @vertices_scene3, notice: 'Vertices scene3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @vertices_scene3 }
      else
        format.html { render :edit }
        format.json { render json: @vertices_scene3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vertices_scene3s/1
  # DELETE /vertices_scene3s/1.json
  def destroy
    @vertices_scene3.destroy
    respond_to do |format|
      format.html { redirect_to vertices_scene3s_url, notice: 'Vertices scene3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vertices_scene3
      @vertices_scene3 = VerticesScene3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vertices_scene3_params
      params.require(:vertices_scene3).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
