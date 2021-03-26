class HealthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_health, only: [:edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def new
   @health = Health.new
  end

  def create
    @health = Health.new(health_params)
    if @health.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @health.update(health_params)
      redirect_to  cat_path(@health.cat_id)
    else
      render :edit
    end
  end

  def destroy
    if @health.destroy
      redirect_to cat_path(@health.cat_id)
    end
  end

  private

  def health_params
    params.require(:health).permit(:recorded_date, :food_id, :tulle_id, :play_id, :weight, :poop_id, :pee_id, :comment, :cat_id).merge(user_id: current_user.id)
  end

  def set_health
    @health = Health.find(params[:id])
  end

  def redirect_root
    if current_user.id != @health.user_id
      redirect_to root_path
    end
  end
end


