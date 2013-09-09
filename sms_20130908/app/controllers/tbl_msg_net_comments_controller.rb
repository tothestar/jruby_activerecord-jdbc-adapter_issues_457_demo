class TblMsgNetCommentsController < ApplicationController
  layout "android"
  # GET /tbl_msg_net_comments
  # GET /tbl_msg_net_comments.json
  def index
    if(params[:search].blank? )
      @tbl_msg_net_comments = TblMsgNetComment.all
    else
      @tbl_msg_net_comments = TblMsgNetComment.where("serialNumber=?",params[:search]).order("created_at DESC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tbl_msg_net_comments }
    end
  end

  # GET /tbl_msg_net_comments/1
  # GET /tbl_msg_net_comments/1.json
  def show
    @tbl_msg_net_comment = TblMsgNetComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tbl_msg_net_comment }
    end
  end

  # GET /tbl_msg_net_comments/new
  # GET /tbl_msg_net_comments/new.json
  def new
    @tbl_msg_net_comment = TblMsgNetComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tbl_msg_net_comment }
    end
  end

  # GET /tbl_msg_net_comments/1/edit
  def edit
    @tbl_msg_net_comment = TblMsgNetComment.find(params[:id])
  end

  # POST /tbl_msg_net_comments
  # POST /tbl_msg_net_comments.json
  def create
    @tbl_msg_net_comment = TblMsgNetComment.new(params[:tbl_msg_net_comment])

    respond_to do |format|
      if @tbl_msg_net_comment.save
        format.html { redirect_to @tbl_msg_net_comment, notice: 'Tbl msg net comment was successfully created.' }
        format.json { render json: @tbl_msg_net_comment, status: :created, location: @tbl_msg_net_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @tbl_msg_net_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tbl_msg_net_comments/1
  # PUT /tbl_msg_net_comments/1.json
  def update
    @tbl_msg_net_comment = TblMsgNetComment.find(params[:id])

    respond_to do |format|
      if @tbl_msg_net_comment.update_attributes(params[:tbl_msg_net_comment])
        format.html { redirect_to @tbl_msg_net_comment, notice: 'Tbl msg net comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tbl_msg_net_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_msg_net_comments/1
  # DELETE /tbl_msg_net_comments/1.json
  def destroy
    @tbl_msg_net_comment = TblMsgNetComment.find(params[:id])
    @tbl_msg_net_comment.destroy

    respond_to do |format|
      format.html { redirect_to tbl_msg_net_comments_url }
      format.json { head :no_content }
    end
  end
end
