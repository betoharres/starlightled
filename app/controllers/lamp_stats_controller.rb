class LampStatsController < ApplicationController
  before_action :set_lamp_stat, only: [:show, :edit, :update, :destroy]
  before_action :set_lamp     , only: [:index]

  # GET /lamp_stats
  # GET /lamp_stats.json
  def index
    # @lamp_stats = LampStat.all.where(serial_num: @lamp.product.serial_number, created_at: 1.month.ago..Date.today )
    @lamp_stats = LampStat.where(serial_num: @lamp.product.serial_number).order(:created_at)
  end

  # GET /lamp_stats/1
  # GET /lamp_stats/1.json
  def show
  end

  def william
    render json: LampStat.last
  end

  # GET /lamp_stats/new
  def new
    @lamp_stat = LampStat.new
  end

  # GET /lamp_stats/1/edit
  def edit
  end

  # POST /lamp_stats
  # POST /lamp_stats.json
  def create
    @lamp_stat = LampStat.new(lamp_stat_params)

    respond_to do |format|
      if @lamp_stat.save
        format.html { redirect_to @lamp_stat, notice: 'Lamp stat was successfully created.' }
        format.json { render :show, status: :created, location: @lamp_stat }
      else
        format.html { render :new }
        format.json { render json: @lamp_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lamp_stats/1
  # PATCH/PUT /lamp_stats/1.json
  def update
    respond_to do |format|
      if @lamp_stat.update(lamp_stat_params)
        format.html { redirect_to @lamp_stat, notice: 'Lamp stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @lamp_stat }
      else
        format.html { render :edit }
        format.json { render json: @lamp_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lamp_stats/1
  # DELETE /lamp_stats/1.json
  def destroy
    @lamp_stat.destroy
    respond_to do |format|
      format.html { redirect_to lamp_stats_url, notice: 'Lamp stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lamp_stat
      @lamp_stat = LampStat.find(params[:id])
    end

    def set_lamp
      @lamp = Lamp.find(params[:lamp_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lamp_stat_params
      params.require(:lamp_stat).permit(:serial_num, :date, :pwr, :current, :volts, :tCom, :tLed1, :tLed2, :sLum, :rssiDev, :lqiDev, :rssi, :lqi, :correlationDev, :correlation, :sentPkts, :rcvPkts, :lastReboot, :txPwr, :ctrlRestart, :vFirmware, :vCmd, :cksCfg, :appCksErr, :cmdNotImp, :online, :communicating, :sunrise, :sunset)
    end
end
