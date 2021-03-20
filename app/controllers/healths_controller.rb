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

  private

  def health_params
    params.require(:health).permit(:recorded_date, :food_id, :tulle_id, :play_id, :weight, :poop_id, :pee_id, :coment, :cat_id)
  end

end
