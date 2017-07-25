class CsvController < ApplicationController
  def index
    @users = User.all
  end

  def import
    User.import(params[:file])
    redirect_to admin_index_path, notice: "학생정보 등록완료"
  end
end
