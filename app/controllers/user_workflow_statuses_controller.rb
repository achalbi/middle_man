class UserWorkflowStatusesController < ApplicationController
  before_action :set_user_workflow_status, only: [:show, :edit, :update, :destroy]

  # GET /user_workflow_statuses
  # GET /user_workflow_statuses.json
  def index
    @user_workflow_statuses = UserWorkflowStatus.all
  end

  # GET /user_workflow_statuses/1
  # GET /user_workflow_statuses/1.json
  def show
  end

  # GET /user_workflow_statuses/new
  def new
    @user_workflow_status = UserWorkflowStatus.new
  end

  # GET /user_workflow_statuses/1/edit
  def edit
  end

  # POST /user_workflow_statuses
  # POST /user_workflow_statuses.json
  def create
    @user_workflow_status = UserWorkflowStatus.new(user_workflow_status_params)

    respond_to do |format|
      if @user_workflow_status.save
        format.html { redirect_to @user_workflow_status, notice: 'User workflow status was successfully created.' }
        format.json { render :show, status: :created, location: @user_workflow_status }
      else
        format.html { render :new }
        format.json { render json: @user_workflow_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_workflow_statuses/1
  # PATCH/PUT /user_workflow_statuses/1.json
  def update
    respond_to do |format|
      if @user_workflow_status.update(user_workflow_status_params)
        format.html { redirect_to @user_workflow_status, notice: 'User workflow status was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_workflow_status }
      else
        format.html { render :edit }
        format.json { render json: @user_workflow_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_workflow_statuses/1
  # DELETE /user_workflow_statuses/1.json
  def destroy
    @user_workflow_status.destroy
    respond_to do |format|
      format.html { redirect_to user_workflow_statuses_url, notice: 'User workflow status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_workflow_status
      @user_workflow_status = UserWorkflowStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_workflow_status_params
      params.require(:user_workflow_status).permit(:user_id, :workflow_id, :workflow_status)
    end
end
