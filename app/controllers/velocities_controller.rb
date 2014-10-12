class VelocitiesController < ApplicationController
  before_action :set_velocity, only: [:show, :edit, :update, :destroy]

  # GET /velocity/new
  def new
    @velocity = Velocity.new(chart_id: params[:id])
  end

  # GET /velocity/1/edit
  def edit
  end

  # POST /velocity
  # POST /velocity.json
  def create
    @velocity = Velocity.new(velocity_params)
    @velocity.chart = Chart.find(params[:id])

    respond_to do |format|
      if @velocity.save
        format.html { redirect_to @velocity.chart, notice: 'Velocity was successfully created.' }
        format.json { render :show, status: :created, location: @velocity.chart }
      else
        format.html { render :new }
        format.json { render json: @velocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /velocity/1
  # PATCH/PUT /velocity/1.json
  def update
    respond_to do |format|
      if @velocity.update(velocity_params)
        format.html { redirect_to @velocity.chart, notice: 'Velocity was successfully updated.' }
        format.json { render :show, status: :ok, location: @velocity.chart }
      else
        format.html { render :edit }
        format.json { render json: @velocity.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_velocity
      @chart = Chart.find(params[:id])
      @velocity = @chart.velocity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def velocity_params
      params.require(:velocity).permit(:chart, :start_count, :end_count, :start_at, :end_at)
    end
end
