class CatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cats = Cat.where(user_id: current_user.id)
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @cat = Cat.find(params[:id])

    birthday = @cat.birthday.strftime("%Y%m%d").to_i
    today = Date.today.strftime("%Y%m%d").to_i
    @age = (today - birthday) / 10000

    @health_data = Health.where(cat_id: @cat.id).order(recorded_date: "DESC") 

  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_path(@cat.id)
    else
      render :edit
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    if cat.destroy
     redirect_to root_path
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birthday, :gender_id, :favorite, :image).merge(user_id: current_user.id)
  end
end

