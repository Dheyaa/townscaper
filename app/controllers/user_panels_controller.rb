class UserPanelsController < ApplicationController
  before_action :set_user_panel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:edit]
  
  def index
    @user_panels = UserPanel.all
  end

  def tutorial
  end

  def pairwise_comparison (array)
    # create pairs in an array
    comparison_number = (array.count * (array.count - 1)) / 2
    comparison_array = []
    i = 0
    while i < array.length
      x = i + 1
      while x < array.length
        pair_array = [array[i], array[x]]
        comparison_array.push(pair_array)
        x += 1
      end
      i += 1
    end
    #Shuffle pairs inside each second item
    y = 0
    while y < comparison_array.length 
      comparison_array[y] = [comparison_array[y][1], comparison_array[y][0]]
      y += 2
    end
    #Shuffle items inside comparison_array
    comparison_array.shuffle!
    #decompose pairs to make it one single array
    final_array = []
    comparison_array.each do |pair|
      final_array.push(pair[0])
      final_array.push(pair[1])
    end
    return final_array
  end
  helper_method :pairwise_comparison

  ### to make sure score are 0 before start
  def format_scenes_scores(scenes)
    scenes.each do |scene|
      Nowscene.update(scene.id, :scene_score => 0)
    end
  end
  helper_method :format_scenes_scores

  def validate_scene
    @user_panel = UserPanel.find(current_user.user_panel.id)
    score = params[:first_scene_score].to_f
    value = params[:value].to_f
    # Check if user chosen same Neutral value for all scenes
    coun = 0;
    fi = @user_panel.nowscenes.order("created_at ASC").first.scene_score
    @user_panel.nowscenes.order("created_at ASC").each do |scene|
      if fi == scene.scene_score
        coun+=1
      end
    end
    if coun == @user_panel.nowscenes.count
      scenes = @user_panel.nowscenes.order('created_at ASC')
      format_scenes_scores(scenes)
      UserPanel.update(@user_panel.id, :scenes_completed => false)
      flash[:alert] = 'Your answer was Neutral for all comaprisons. Please repeat the experiment'
    elsif (value >= 1 && score <= 1) || (value <= 1 && score >= 1)
      UserPanel.update(@user_panel.id, :scene_valid => true)
    else
      scenes = @user_panel.nowscenes.order('created_at ASC')
      format_scenes_scores(scenes)
      UserPanel.update(@user_panel.id, :scenes_completed => false)
      flash[:alert] = 'Your answers are not consistent. Please repeat the experiment'
    end
    redirect_to action: "show", id: @user_panel.id
  end

  def update_scene
    @user_panel = UserPanel.find(current_user.user_panel.id)
    if params[:tutorial] == "true"
      UserPanel.update(@user_panel.id, :tutorial_completed => true)
    else
      scenes_ids = params[:scene_ids]
      first_pair_ids = params[:first_pair_scene_ids]
      if scenes_ids.count / 2 == (@user_panel.nowscenes.count * (@user_panel.nowscenes.count - 1)) / 2
        first_score = params[:value].to_f
      else
        first_score = params[:first_score].to_f
      end
      @scene1 = @user_panel.nowscenes.find(params[:scene1_id])
      @scene2 = @user_panel.nowscenes.find(params[:scene2_id])
      if @scene1.scene_score.nil?
        original_score1 = 0
      else
        original_score1 = @scene1.scene_score
      end
      if @scene2.scene_score.nil?
        original_score2 = 0
      else
        original_score2 = @scene2.scene_score
      end
      if params[:value]
        new_score1 = params[:value].to_f
        new_score2 = 1 / new_score1
        @user_panel.nowscenes.update(params[:scene1_id], :scene_score => new_score1 + original_score1)
        @user_panel.nowscenes.update(params[:scene2_id], :scene_score => new_score2 + original_score2)
        scenes_ids.shift(2)
        if scenes_ids.length == 0
          UserPanel.update(@user_panel.id, :scenes_completed => true)
        end
        if first_pair_ids
          session[:scenescore] = first_score
          session[:scenefirst_pair_ids] = first_pair_ids
        end
          session[:scenes_id] = scenes_ids
      else
        flash[:alert] = 'Please select a button.'
      end
    end
    redirect_to action: "show", id: @user_panel.id
  end

  def show
    # This is temporarly
    unless @user_panel.admin_panel_id.nil? || @user_panel.admin_panel_id.blank?
      @admin_panel = AdminPanel.find(@user_panel.admin_panel_id)
    else
      @admin_panel = AdminPanel.first 
    end
    if session[:scenefirst_pair_ids]
      @first_scene_score = session[:scenescore] 
      scene_pair_ids = session[:scenefirst_pair_ids]
      @first_pair_scene = []
      scene_pair_ids.each do |id|
        @first_pair_scene.push(Nowscene.find(id))
      end
    end
    if session[:scenes_id]
      @scenes = []
      scene_ids = session[:scenes_id]
      scene_ids.each do |id|
        @scenes.push(Nowscene.find(id))
      end
    end
  end

  def show_redirect (panel_id)
    redirect_to action: "show", id: panel_id
  end
  helper_method :show_redirect

  def new
    if current_user.user_panel
      redirect_to action: "show", id: current_user.user_panel.id 
    else
      #This is Temporary
      unless params[:admin_panel_id].nil? || params[:admin_panel_id].blank?
        @user_panel = UserPanel.new(admin_panel_id: params[:admin_panel_id], user_id: current_user.id)
        # @user_panel.save
      else
        @user_panel = UserPanel.new(admin_panel_id: AdminPanel.first.id, user_id: current_user.id)
        # @user_panel.save
      end
      ######
    end
  end

  def edit
  end

  def create
    @user_panel = UserPanel.new(user_panel_params)
    if (UserPanel.all.count + 1) % 3 == 0
      scenes = Scene3.all.order('created_at ASC')
    elsif (UserPanel.all.count + 1) % 2 == 0
      scenes = Scene2.all.order('created_at ASC')
    else
      scenes = Scene1.all.order('created_at ASC')
    end
    scenes.order('created_at ASC').each do |scene|
      @user_panel.nowscenes.new(file_name: scene.file_name, vertices_number: scene.vertices_number, space_ratio: scene.space_ratio, position_difference: scene.position_difference, colour_difference: scene.colour_difference, admin_panel_id: @user_panel.admin_panel_id, user_panel_id: @user_panel.id)
    end
    respond_to do |format|
      if @user_panel.save 
        format.html { redirect_to @user_panel, notice: 'User panel was successfully created.' }
        format.json { render :show, status: :created, location: @user_panel }
      else
        format.html { render :new }
        format.json { render json: @user_panel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_panel.update(user_panel_params)
        format.html { redirect_to @user_panel, notice: 'User panel was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_panel }
      else
        format.html { render :edit }
        format.json { render json: @user_panel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_panel.destroy
    respond_to do |format|
      format.html { redirect_to user_panels_url, notice: 'User panel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_panel
      @user_panel = UserPanel.find(params[:id])
    end

    def user_panel_params
      params.require(:user_panel).permit(:consent, :feedback, :user_id, :admin_panel_id, :scenes_completed, :tutorial_completed, :scene_valid, :age_group, :art_related, :gender, :education_level)
    end
end
