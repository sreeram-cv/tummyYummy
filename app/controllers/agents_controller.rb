class AgentsController < ApplicationController
  before_action { flash.clear }
  before_action :set_agent, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update,:show]
  before_action :correct_user,   only: [:edit, :update,:show]

  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if @agent.save
        sign_in @agent,"agent"
        format.html { redirect_to @agent}
        format.json { render action: 'show', status: :created, location: @agent }
      else
        format.html { render action: 'new' }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        flash.now[:success] = "Profile updated"
        format.html { redirect_to @agent}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url }
      format.json { head :no_content }
    end
  end

  def signed_in_user
    unless signed_in?
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = Agent.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:name, :email, :password, :confpassword, :address, :phone, :items)
    end
end
