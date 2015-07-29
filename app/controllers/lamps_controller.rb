class LampsController < ApplicationController
  before_action :set_lamp, only: [:show, :edit, :update, :destroy]
  before_filter :require_user_signed_in

  # GET /lamps
  # GET /lamps.json
  def index
    @lamps = Lamp.all
  end

  # GET /lamps/1
  # GET /lamps/1.json
  def show
    @product = @lamp.product
    @chart = LampStat.where(serial_num: @product.serial_number)
                     .where(date: 2.day.ago..DateTime.now)
                     .order(:date)
                     .map(&:to_chart)
  end

  # GET /lamps/new
  def new
    @lamp = Lamp.new
  end

  # GET /lamps/1/edit
  def edit
  end

  # POST /lamps
  # POST /lamps.json
  def create
    @lamp = Lamp.new(lamp_params)
    @lamp.product.company_id = current_user.company.id if @lamp.product
    @lamp.product.node_id = params[:node_id] if params[:node_id]

    respond_to do |format|
      if @lamp.save
        format.html { redirect_to @lamp, notice: 'Lamp was successfully created.' }
        format.json { render :show, status: :created, location: @lamp }
      else
        format.html { render :new }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lamps/1
  # PATCH/PUT /lamps/1.json
  def update
    respond_to do |format|
      hash = lamp_params
      hash[:product_attributes].merge!(company_id: current_user.company.id) if hash[:product_attributes]
      if @lamp.update(hash)
        format.html { redirect_to @lamp, notice: 'Lamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @lamp }
      else
        format.html { render :edit }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lamps/1
  # DELETE /lamps/1.json
  def destroy
    @lamp.destroy
    respond_to do |format|
      format.html { redirect_to lamps_url, notice: 'Lamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lamp
      @lamp = Lamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lamp_params
      params.require(:lamp).permit(:font_type, :font_subtype, :tag_list, product_attributes: [:name, :model, :serial_number, :mac_address, :product_code, :fabrication_date, :tension_operation, :node_id])
    end
end
