module Api
  module V1
    class EventsController < BaseController
      before_action :set_event, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_gateway!

      # GET /events
      # GET /events.json
      def index
        @events = Event.all
        @events = Event.all.where(company_id: current_user.company.id)
      end

      # GET /events/1
      # GET /events/1.json
      def show
      end

      # GET /events/new
      def new
        @event = Event.new
      end

      # GET /events/1/edit
      def edit
      end

      # POST /events
      # POST /events.json
      def create
        @event = Event.new
        @event.event_code = EventCode.find_by(code: event_params[:code])
        @event.serial_number = event_params[:serial_number]
        @event.date = event_params[:date]
        @event.param = Param.find_by(code: event_params[:param_code])
        @event.node = Product.find_by(serial_number: event_params[:serial_number]).node
        @event.company_id = current_gateway.product.company.id

        respond_to do |format|
          if @event.save
            format.json { render :show, status: :created, location: @event }
          else
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /events/1
      # PATCH/PUT /events/1.json
      def update
        respond_to do |format|
          if @event.update(event_params)
            format.html { redirect_to @event, notice: 'Event was successfully updated.' }
            format.json { render :show, status: :ok, location: @event }
          else
            format.html { render :edit }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /events/1
      # DELETE /events/1.json
      def destroy
        @event.destroy
        respond_to do |format|
          format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_event
          @event = Event.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def event_params
          params.require(:event).permit(:code, :param_code, :serial_number, :date)
        end
    end
  end
end
