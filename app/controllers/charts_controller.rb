class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :edit, :update, :destroy]

  # GET /charts
  # GET /charts.json
  def index
    @charts = Chart.all
  end

  # GET /charts/1
  # GET /charts/1.json
  def show
  end

  # GET /charts/new
  def new
    @chart = Chart.new
  end

  # GET /charts/1/edit
  def edit
  end

  # POST /charts
  # POST /charts.json
  def create
    @chart = Chart.new(chart_params)

    respond_to do |format|
      if @chart.save
        format.html { redirect_to @chart, notice: 'Chart was successfully created.' }
        format.json { render :show, status: :created, location: @chart }
      else
        format.html { render :new }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charts/1
  # PATCH/PUT /charts/1.json
  def update
    respond_to do |format|
      if @chart.update(chart_params)
        format.html { redirect_to @chart, notice: 'Chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @chart }
      else
        format.html { render :edit }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charts/1
  # DELETE /charts/1.json
  def destroy
    @chart.destroy
    respond_to do |format|
      format.html { redirect_to charts_url, notice: 'Chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_data
    respond_to do |format|
      format.json do
        data = []
        data[0] = data[1] = data[2] = []

        velocity = Velocity.find_by(chart_id: params[:chart_id])
        r = velocity.start_count - velocity.end_count
        cnt = (velocity.end_at - velocity.start_at).to_i
        v = r / cnt
        cnt.times do |i|
          data[2] << velocity.start_count - i * v
        end
        data[2].unshift "Ideal"

        data[1] = cnt.times.map{ |i| (i * rand(1.0..3.0)).to_i }
        data[1].sort!.reverse!
        data[1].unshift "Actual"

        data[0] = cnt.times.map{ |i| (velocity.end_at - (cnt - i)).to_date.to_s }
        data[0].unshift "x"

        render json: data
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart
      @chart = Chart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chart_params
      params.require(:chart).permit(:name, :team_id)
    end
end
