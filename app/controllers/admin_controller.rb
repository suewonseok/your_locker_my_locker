class AdminController < ApplicationController
  def index
    @user_admin = User.all.order('stuN ASC')
  end
end
