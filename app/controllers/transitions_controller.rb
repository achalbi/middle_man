class TransitionsController < ApplicationController
  before_action :set_transition, only: [:show, :edit, :update, :destroy, :set_state]
  before_action :set_workflow_event

  # GET /transitions
  # GET /transitions.json
  def index
    @transitions = @workflow_event.transition.to_a
  end

  # GET /transitions/1
  # GET /transitions/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json { render json:  @transition}
    end
  end

  # GET /transitions/new
  def new
    @transition = @workflow_event.build_transition
  end

  # GET /transitions/1/edit
  def edit
  end

  # POST /transitions
  # POST /transitions.json
  def create
    @transition = @workflow_event.build_transition(transition_params)

    respond_to do |format|
      if @transition.save
        format.html { redirect_to workflow_event_transition_path(@workflow_event, @transition), notice: 'Transition was successfully created.' }
        format.json { render :show, status: :created, location: @transition }
      else
        format.html { render :new }
        format.json { render json: @transition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transitions/1
  # PATCH/PUT /transitions/1.json
  def update
    respond_to do |format|
      if @transition.update(transition_params)
        format.html { redirect_to workflow_event_transition_path(@workflow_event, @transition), notice: 'Transition was successfully updated.' }
        format.json { render :show, status: :ok, location: @transition }
      else
        format.html { render :edit }
        format.json { render json: @transition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transitions/1
  # DELETE /transitions/1.json
  def destroy
    @transition.destroy
    respond_to do |format|
      format.html { redirect_to workflow_events_transitions_url, notice: 'Transition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_state
=begin
    uws = UserWorkflowStatus.find_or_create_by(user_id: current_user.id)
    uws.workflow_state = @transition.workflow_state
    uws.workflow = @transition.workflow_state.workflow
    uws.save
=end

    respond_to do |format|
      format.json { render json:  @transition.workflow_state }
    end

   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transition
      @transition = Transition.find(params[:id])
    end

    def set_workflow_event
      @workflow_event = WorkflowEvent.find(params[:workflow_event_id])
      @workflow = @workflow_event.workflow_state.workflow
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transition_params
      params.require(:transition).permit(:workflow_state_id, :workflow_event_id)
    end
end
