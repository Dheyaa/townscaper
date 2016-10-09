class VerticesScene2sController < ApplicationController
  before_action :set_vertices_scene2, only: [:show, :edit, :update, :destroy]

  # GET /vertices_scene2s
  # GET /vertices_scene2s.json
  def index
    @vertices_scene2s = VerticesScene2.all
  end

  # GET /vertices_scene2s/1
  # GET /vertices_scene2s/1.json
  def show
  end

  # GET /vertices_scene2s/new
  def new
    @vertices_scene2 = VerticesScene2.new
  end

  # GET /vertices_scene2s/1/edit
  def edit
  end

  # POST /vertices_scene2s
  # POST /vertices_scene2s.json
  def create
    @vertices_scene2 = VerticesScene2.new(vertices_scene2_params)

    respond_to do |format|
      if @vertices_scene2.save
        format.html { redirect_to @vertices_scene2, notice: 'Vertices scene2 was successfully created.' }
        format.json { render :show, status: :created, location: @vertices_scene2 }
      else
        format.html { render :new }
        format.json { render json: @vertices_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vertices_scene2s/1
  # PATCH/PUT /vertices_scene2s/1.json
  def update
    respond_to do |format|
      if @vertices_scene2.update(vertices_scene2_params)
        format.html { redirect_to @vertices_scene2, notice: 'Vertices scene2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @vertices_scene2 }
      else
        format.html { render :edit }
        format.json { render json: @vertices_scene2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vertices_scene2s/1
  # DELETE /vertices_scene2s/1.json
  def destroy
    @vertices_scene2.destroy
    respond_to do |format|
      format.html { redirect_to vertices_scene2s_url, notice: 'Vertices scene2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vertices_scene2
      @vertices_scene2 = VerticesScene2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vertices_scene2_params
      params.require(:vertices_scene2).permit(:file_name, :vertices_number, :space_ratio, :position_difference, :colour_difference, :scene_score, :admin_panel_id, :user_panel_id)
    end
end
