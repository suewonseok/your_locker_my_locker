class BoxController < ApplicationController
  layout "user"
  before_action :user_apply?, only: [:index, :create, :new]

  def index
    number_one = (1..10)
    number_two = (11..20)
    number_thr = (21..30)
    number_fou = (31..40)
    number_fiv = (41..50)
    @number = [number_one, number_two, number_thr, number_fou, number_fiv]

  end

  def new
    @user = current_user
  end

  def create
    if  User.find_by(seatNumber:params[:seatNumber])
      redirect_to box_index_path, method:"get"
      flash[:alert] = "이미 신청완료 된 사물함입니다."
    else
      current_user.seatNumber = params[:seatNumber]
      current_user.save
      redirect_to new_box_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.seatNumber = nil
    user.save

    redirect_to new_post_path
  end
end
