class AdminController < ApplicationController
  def index
    @user_admin = User.all.order('stuN ASC')
  end

  def destroy
    user = User.find(params[:id])
    if user.admin != true
      user.destroy
    else
      flash[:caution] = "관리자 계정은 삭제할 수 없습니다."
    end
    redirect_to admin_index_path
  end

  def destroy_all
    User.where(admin: nil).destroy_all
    flash[:caution] = "전체 계정 정보가 초기화 되었습니다."
    redirect_to admin_index_path
  end
end
