class CatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cat, only: [:edit, :show, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy, :show]

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

    birthday = @cat.birthday.strftime("%Y%m%d").to_i
    today = Date.today.strftime("%Y%m%d").to_i
    @age = (today - birthday) / 10000

    @health_data = Health.where(cat_id: @cat.id).order(recorded_date: "DESC").page(params[:page]).per(10)

  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to cat_path(@cat.id)
    else
      render :edit
    end
  end

  def destroy
    if @cat.destroy
     redirect_to root_path
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birthday, :gender_id, :favorite, :image).merge(user_id: current_user.id)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def redirect_root
    if current_user.id != @cat.user_id
      redirect_to root_path
    end
  end
end

