class FeedBacksController < ApplicationController
  before_action :set_feed_back, only: [:show, :edit, :update, :destroy]

  def index
    @feed_backs = FeedBack.all
  end

  def show
    @user_panels = UserPanel.all
  end

  def new
    @feed_back = FeedBack.new(user_panel_id: current_user.user_panel.id)
  end

  def edit
  end

  def create
    @feed_back = FeedBack.new(feed_back_params)
    respond_to do |format|
      if @feed_back.save
        format.html { redirect_to @feed_back, notice: 'Feed back was successfully created.' }
        format.json { render :show, status: :created, location: @feed_back }
      else
        format.html { render :new }
        format.json { render json: @feed_back.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed_back.update(feed_back_params)
        format.html { redirect_to @feed_back, notice: 'Feed back was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed_back }
      else
        format.html { render :edit }
        format.json { render json: @feed_back.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed_back.destroy
    respond_to do |format|
      format.html { redirect_to feed_backs_url, notice: 'Feed back was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_feed_back
      @feed_back = FeedBack.find(params[:id])
    end

    def feed_back_params
      params.require(:feed_back).permit(:title, :body, :user_panel_id)
    end
end
