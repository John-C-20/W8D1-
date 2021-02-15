class SubsController < ApplicationController

  before_action :ensure_mod, only: [:update, :edit]

  def ensure_mod
    @sub = Sub.find_by_id(params[:id])
    redirect_to sub_url(@sub) unless @sub.user_id == current_user.id
  end
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
    render :edit
  end

  def update
    @sub = Sub.update(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find_by_id(params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
