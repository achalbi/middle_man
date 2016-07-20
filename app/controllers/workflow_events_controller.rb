class WorkflowEventsController < ApplicationController
  before_action :set_workflow_event, only: [:show, :edit, :update, :destroy]
  before_action :set_workflow_state


  # GET /workflow_events
  # GET /workflow_events.json
  def index
    @workflow_events = @workflow_state.workflow_events
  end

  # GET /workflow_events/1
  # GET /workflow_events/1.json
  def show
    @transition = @workflow_event.transition
    respond_to do |format|
        format.html {}
        format.json { render json: @workflow_event }
    end
  end

  # GET /workflow_events/new
  def new
    @workflow_event = @workflow_state.workflow_events.build
  end

  # GET /workflow_events/1/edit
  def edit
  end

  # POST /workflow_events
  # POST /workflow_events.json
  def create
    @workflow_event = WorkflowEvent.new(workflow_event_params)

    respond_to do |format|
      if @workflow_event.save
        format.html { redirect_to workflow_state_workflow_event_path(@workflow_state, @workflow_event), notice: 'Workflow event was successfully created.' }
        format.json { render :show, status: :created, location: @workflow_event }
      else
        format.html { render :new }
        format.json { render json: @workflow_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workflow_events/1
  # PATCH/PUT /workflow_events/1.json
  def update
    respond_to do |format|
      if @workflow_event.update(workflow_event_params)
        format.html { redirect_to workflow_state_workflow_event_path(@workflow_state, @workflow_event), notice: 'Workflow event was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow_event }
      else
        format.html { render :edit }
        format.json { render json: @workflow_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workflow_events/1
  # DELETE /workflow_events/1.json
  def destroy
    @workflow_event.destroy
    respond_to do |format|
      format.html { redirect_to workflow_state_workflow_events_path, notice: 'Workflow event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow_event
      @workflow_event = WorkflowEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_event_params
      params.require(:workflow_event).permit(:workflow_state_id, :event, :id)
    end

    def set_workflow_state
      @workflow_state = WorkflowState.find(params[:workflow_state_id])
    end
end
