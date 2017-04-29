class IndexController < ApplicationController

  def index

    @users = User.all

    respond_to do |format|
      format.html
      format.xml  {render :json => @users}
    end

  end

  def detail

    @sexes = {
        "male"=>"1",
        "female"=>"2"
    }

    if !params[:id].blank? then
      @user = User.find(params[:id])
    else
      @user = User.new
      @user.sex = 1
    end

  end

  def save

    @param = params[:user]
    @sexes = {
        "male"=>"1",
        "female"=>"2"
    }

    if @param['id'].blank? then
      @user = User.new
    else
      @user = User.find(@param['id'])
    end

    @user.name = @param['name']
    @user.sex = @param['sex']

    if @user.save then
      flash[:notice] = "登録が完了しました。"
      redirect_to :action => "detail", :id => @user.id
    else
      flash[:notice] = "登録に失敗しました。"
      render action: :detail
    end

  end
  
end
