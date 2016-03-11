module Api
  module V1
    class GatewayStatsController < ApplicationController
      before_action :authenticate_gateway!, only: [:create]
      before_filter :require_user_signed_in, except: [:create]
      before_action :set_gateway_stat, only: [:show, :edit, :update, :destroy]

      # GET /gateway_stats
      # GET /gateway_stats.json
      def index
        @gateway_stats = GatewayStat.all.where(created_at: 1.day.ago..DateTime.now)
      end

      # GET /gateway_stats/1
      # GET /gateway_stats/1.json
      def show
      end

      # GET /gateway_stats/new
      def new
        @gateway_stat = GatewayStat.new
      end

      # GET /gateway_stats/1/edit
      def edit
      end

      # POST /gateway_stats
      # POST /gateway_stats.json
      def create
        @gateway_stat = GatewayStat.new(gateway_stat_params)

        respond_to do |format|
          @tasks = Task.cache_tasks @gateway_stat.serial_num
          @tasks = @tasks.as_json(only: [:id, :code, :attachable_id])
                        .merge(serial: @gateway_stat.serial_num) if @tasks
          if @gateway_stat.save
            format.html { redirect_to @gateway_stat, notice: 'Gateway stat was successfully created.' }
            @tasks ? format.json {render json: @tasks, status: :created} : format.json {head :no_content}
          else
            format.html { render :new }
            format.json { render json: @gateway_stat.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /gateway_stats/1
      # PATCH/PUT /gateway_stats/1.json
      def update
        respond_to do |format|
          if @gateway_stat.update(gateway_stat_params)
            format.html { redirect_to @gateway_stat, notice: 'Gateway stat was successfully updated.' }
            format.json { render :show, status: :ok, location: @gateway_stat }
          else
            format.html { render :edit }
            format.json { render json: @gateway_stat.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /gateway_stats/1
      # DELETE /gateway_stats/1.json
      def destroy
        @gateway_stat.destroy
        respond_to do |format|
          format.html { redirect_to gateway_stats_url, notice: 'Gateway stat was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_gateway_stat
          @gateway_stat = GatewayStat.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def gateway_stat_params
          params.require(:gateway_stat).permit(:serial_num, :date, :onlineDev, :signal, :lqi, :rssi, :correlation, :rcvPkts, :sentPkts, :lastReboot, :temp, :battery, :vKl, :vZigbee, :errorsCount, :alerts, :acPwr)
        end
    end
  end
end
