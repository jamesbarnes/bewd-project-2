class UsersController < ApplicationController
  before_action :load_resource
  before_filter :authenticate_user!,
    :only => [:show, :edit]

  def show
  end
  
  def edit
  end

  def load_resource
    @user = User.find params[:id]
  end

end
