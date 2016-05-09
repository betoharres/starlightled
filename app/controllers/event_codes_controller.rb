class EventCodesController < ApplicationController
  before_action :set_event_code, only: [:show, :edit, :update, :destroy]

  # GET /event_codes
  # GET /event_codes.json
  def index
    @event_codes = EventCode.all
  end

  # GET /event_codes/1
  # GET /event_codes/1.json
  def show
  end

  # GET /event_codes/new
  def new
    @event_code = EventCode.new
  end

  # GET /event_codes/1/edit
  def edit
  end

  # POST /event_codes
  # POST /event_codes.json
  def create
    @event_code = EventCode.new(event_code_params)

    respond_to do |format|
      if @event_code.save
        format.html { redirect_to @event_code, notice: 'Event code was successfully created.' }
        format.json { render :show, status: :created, location: @event_code }
      else
        format.html { render :new }
        format.json { render json: @event_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_codes/1
  # PATCH/PUT /event_codes/1.json
  def update
    respond_to do |format|
      if @event_code.update(event_code_params)
        format.html { redirect_to @event_code, notice: 'Event code was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_code }
      else
        format.html { render :edit }
        format.json { render json: @event_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_codes/1
  # DELETE /event_codes/1.json
  def destroy
    @event_code.destroy
    respond_to do |format|
      format.html { redirect_to event_codes_url, notice: 'Event code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_code
      @event_code = EventCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_code_params
      params.require(:event_code).permit(:code, :name)
    end
end
