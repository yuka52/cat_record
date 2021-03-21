class HealthsController < ApplicationController
  def new
   @health = Health.new
   @cats = Cat.all
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
    @health = Health.find(params[:id])
  end

  def update
    @health = Health.find(params[:id])
    if @health.update(health_params)
      redirect_to  cat_path(@health.cat_id)
    else
      render :edit
    end
  end

  def destroy
    health = Health.find(params[:id])
    if health.destroy
      redirect_to cat_path(health.cat_id)
    end
  end

  private

  def health_params
    params.require(:health).permit(:recorded_date, :food_id, :tulle_id, :play_id, :weight, :poop_id, :pee_id, :comment, :cat_id)
  end

end
