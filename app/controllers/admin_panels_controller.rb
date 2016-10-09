class AdminPanelsController < ApplicationController
  before_action :set_admin_panel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @admin_panels = AdminPanel.all
  end

  def show
    if session[:valid_scores] 
      @valid_scores = session[:valid_scores] 
    end
    if session[:verified_user]
      @verified_user = session[:verified_user]
    end
    if session[:show_scenes_value]
      @show_scenes = session[:show_scenes_value]
    end
    if session[:show_feedback_value]
      @show_feedback = session[:show_feedback_value]
    end
    if session[:show_users_value]
      @show_users = session[:show_users_value]
    end
    if session[:show_data_value]
      @show_data = session[:show_data_value]
    end
  end

  def delete_users
    @admin_panel = AdminPanel.find(params[:id])
    @admin_panel.user_panels.delete_all
    redirect_to @admin_panel
  end

  def destroy_user
    @admin_panel = AdminPanel.find(current_admin.admin_panel.id) 
    UserPanel.find(params[:id]).destroy
    flash[:alert] = 'User panel has been deleted.'
    redirect_to @admin_panel
  end

  def show_scenes
    @admin_panel = AdminPanel.find(params[:id])
    if (params[:show_scenes]).to_f == 6
      show_scenes_value = 0
    else
      show_scenes_value = 6
    end
    session[:show_scenes_value] = show_scenes_value
    redirect_to @admin_panel
  end


  def show_feedback
    @admin_panel = AdminPanel.find(params[:admin_id])
    @feed_back = FeedBack.find(params[:id])
    if (params[:show_feedback]).to_f == 6
      show_feedback_value = 0
    else
      show_feedback_value = 6
    end
    session[:show_feedback_value] = show_feedback_value
    redirect_to @admin_panel
  end

  def show_data
    @admin_panel = AdminPanel.find(params[:id])
    if (params[:show_data]).to_f == 6
      show_data_value = 0
    else
      show_data_value = 6
    end
    session[:show_data_value] = show_data_value
    redirect_to @admin_panel
  end

  def show_users
    @admin_panel = AdminPanel.find(params[:id])
    if (params[:show_users]).to_f == 6
      show_users_value = 0
    else
      show_users_value = 6
    end
    session[:show_users_value] = show_users_value
    redirect_to @admin_panel
  end

  def new
    @admin_panel = AdminPanel.new(admin_id: current_admin.id)
  end

  def edit
  end

  def create
    @admin_panel = AdminPanel.new(admin_panel_params)

    respond_to do |format|
      if @admin_panel.save
        format.html { redirect_to @admin_panel, notice: 'Admin panel was successfully created.' }
        format.json { render :show, status: :created, location: @admin_panel }
      else
        format.html { render :new }
        format.json { render json: @admin_panel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @admin_panel.user_panels.count > 0
      flash[:alert] = 'Already have users. Too late to make changes.'
      redirect_to @admin_panel
    else
      respond_to do |format|
        if @admin_panel.update(admin_panel_params)
          format.html { redirect_to @admin_panel, notice: 'Admin panel was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_panel }
        else
          format.html { render :edit }
          format.json { render json: @admin_panel.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @admin_panel.destroy
    respond_to do |format|
      format.html { redirect_to admin_panels_url, notice: 'Admin panel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_panel
      @admin_panel = AdminPanel.find(params[:id])
    end

    def admin_panel_params
      params.require(:admin_panel).permit(:project_name, :admin_id)
    end
end
