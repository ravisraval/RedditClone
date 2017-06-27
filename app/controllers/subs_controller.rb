class SubsController < ApplicationController
  # before_action :require_signed_in, only: [:new, :create]

  def edit
    if @sub.user_id == current_user.id
      @sub = Sub.find(params[:id])
    else
      flash[:errors] = ["prohibit editing from non-moderator"]
      redirect_to subs_url
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.user_id == current_user.id && @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
