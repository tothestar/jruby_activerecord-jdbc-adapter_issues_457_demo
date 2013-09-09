# encoding: utf-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if(params[:search].blank? )
      case current_user.role_id
      when 1
        @users = User.order(:id).page(params[:page])
      when 2,22
        @users = User.where("branch_id=?",current_user.branch_id).order(:id).page(params[:page])
      when 3
        @users = User.where("department_id=?",current_user.department_id).order(:id).page(params[:page])
      end

    else
      @users = User.where("name = ? or mobile = ? or email like ?",params[:search],params[:search],"%"+params[:search]+"%").page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.branch_id.nil?
      @user.branch_id = current_user.branch_id
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.branch_id.nil?
      @user.branch_id = current_user.branch_id
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # GET /users/update_password
  # #PUT /users/update_password/1.json
  def edit_password
   @user = User.find(current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end

  end
  # PUT /users/update_password
  # #PUT /users/update_password/1.json
  def update_password
    @user = User.find(current_user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_path, :notice => '密码修改成功.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit_password" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def reset_password
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attribute(:password,'88888888')
        #format.html { redirect_to users_path, :notice => '密码重置成功.' }
        format.html { redirect_to :back, :notice => '密码重置成功.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit_password" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
