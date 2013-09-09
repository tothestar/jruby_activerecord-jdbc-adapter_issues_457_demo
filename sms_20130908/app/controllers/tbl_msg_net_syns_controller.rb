# -*- encoding : utf-8 -*-
class TblMsgNetSynsController < ApplicationController
# d  layout "android"

  include HTTParty
  headers 'Accept' => 'application/json'
  headers 'Content-Type' => 'application/json'

  # GET /tbl_msg_net_syns
  # GET /tbl_msg_net_syns.json
  def index
    if(!cookies[:user_id].blank?)
      @tbl_msg_net_syns = TblMsgNetSyn.where(:sendUserPhone=>cookies[:manager]).order("created_at desc").page(params[:page])
    else
      #added new 20130907
      case current_user.role_id
      when 1,22
      @tbl_msg_net_syns = TblMsgNetSyn.order("created_at desc").page(params[:page])
      when 24
      @tbl_msg_net_syns = TblMsgNetSyn.where(:sendUserPhone=>current_user.mobile).order("created_at desc").page(params[:page])
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tbl_msg_net_syns }
    end
  end

  # GET /tbl_msg_net_syns/1
  # GET /tbl_msg_net_syns/1.json
  def show
    @tbl_msg_net_syn = TblMsgNetSyn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tbl_msg_net_syn }
    end
  end

  # GET /tbl_msg_net_syns/new
  # GET /tbl_msg_net_syns/new.json
  def new
    @tbl_msg_net_syn = TblMsgNetSyn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tbl_msg_net_syn }
    end
  end

  # GET /tbl_msg_net_syns/1/edit
  def edit
    @tbl_msg_net_syn = TblMsgNetSyn.find(params[:id])
  end

  # POST /tbl_msg_net_syns
  # POST /tbl_msg_net_syns.json
  def create
    @tbl_msg_net_syn = TblMsgNetSyn.new(params[:tbl_msg_net_syn])
    if @tbl_msg_net_syn.duration.blank? and  !params[:duration_radio].blank?
       @tbl_msg_net_syn.duration = "偶尔一次"
    end
    # by mtj 20130907
    if @tbl_msg_net_syn.sendUser.blank?
      @tbl_msg_net_syn.sendUser = current_user.name
      @tbl_msg_net_syn.sendUserPhone = current_user.mobile

    end
   # response = TblMsgNetSynsController.get('http://218.200.48.162/msgcommentxianRest/msg/customerType/'+@tbl_msg_net_syn.phoneNum)
   # @tbl_msg_net_syn.customerType = response.body.gsub( /"/,'')
    response = TblMsgNetSynsController.get('http://218.200.48.162/msgcommentxianRest/msg/customerinfo/'+@tbl_msg_net_syn.phoneNum)
    h =  response.body.to_s.force_encoding("UTF-8")
    j = ActiveSupport::JSON.decode(h)
    
    @tbl_msg_net_syn.customerType = j["customerType"]
    @tbl_msg_net_syn.credit = j["credit"]
    @tbl_msg_net_syn.flow = j["flow"]
    @tbl_msg_net_syn.unitid = j["unitid"]
    @tbl_msg_net_syn.unitname = j["unitname"]
    @tbl_msg_net_syn.unittype = j["unittype"]

    respond_to do |format|
      if @tbl_msg_net_syn.save
        format.html { redirect_to @tbl_msg_net_syn, notice: 'Tbl msg net syn was successfully created.' }
        format.json { render json: @tbl_msg_net_syn, status: :created, location: @tbl_msg_net_syn }
      else
        format.html { render action: "new" }
        format.json { render json: @tbl_msg_net_syn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tbl_msg_net_syns/1
  # PUT /tbl_msg_net_syns/1.json
  def update
    @tbl_msg_net_syn = TblMsgNetSyn.find(params[:id])

    respond_to do |format|
      if @tbl_msg_net_syn.update_attributes(params[:tbl_msg_net_syn])
        format.html { redirect_to @tbl_msg_net_syn, notice: 'Tbl msg net syn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tbl_msg_net_syn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_msg_net_syns/1
  # DELETE /tbl_msg_net_syns/1.json
  def destroy
    @tbl_msg_net_syn = TblMsgNetSyn.find(params[:id])
    @tbl_msg_net_syn.destroy

    respond_to do |format|
      format.html { redirect_to tbl_msg_net_syns_url }
      format.json { head :no_content }
    end
  end

  # PUT /tblnetmsgsyns/1/close
  # PUT /tblnetmsgsyns/1/close.json
  def close
    @tbl_msg_net_syn = TblMsgNetSyn.find(params[:id])

    respond_to do |format|
      if @tbl_msg_net_syn.update_attribute("col_syn_state", 3)
        format.html { redirect_to request.env["HTTP_REFERER"]  , :notice => '发>布成功.' }
        #format.json { head :no_content }
      else
        format.html { redirect_to request.env["HTTP_REFERER"]  , :notice => '出>错了.'}
        #format.json { render :json => @print_job.errors, :status => :unprocessable_entity }
      end
    end
  end

end
