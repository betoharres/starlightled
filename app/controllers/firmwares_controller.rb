class FirmwaresController < ApplicationController
  before_action :set_firmware, only: [:show, :edit, :update, :destroy]
  # before_filter :require_user_signed_in, except: :show
  after_action :filter_header, only: :show

  # GET /firmwares
  # GET /firmwares.json
  def index
    @firmwares = Firmware.all.order(:id)
  end

  # GET /firmwares/1
  # GET /firmwares/1.json
  def show
    # This will send the entire file stored in the database if no params is sent,
    # or it will interact byte by byte if a range is declared in the params as "s"
    # to start and "e" to end.
    # Then it will "pack" it to binary again and serve as a downloadable file so
    # the gateway can read it.
    #
    # TODO: Check about Streaming and see if it can be refactored
    # http://api.rubyonrails.org/classes/ActionController/Streaming.html
    if params[:s] && params[:e]
      a = []
      # append each byte of the firmware in a field of the array
      @firmware.file_content.each_byte do |byte|
        a << byte
      end
      # stores in a variable the range that was requested
      selected_content = a[params[:s].to_i..params[:e].to_i]
      # transforms the selected range back to binary
      selected_content = selected_content.pack('c*')
      response.headers['PARTIAL-CHECKSUM'] = Digest::SHA1.hexdigest(selected_content)
    end
    # if the selected_content was not set, use the entire file
    selected_content ||= @firmware.file_content
    send_data(selected_content,
              type: @firmware.content_type,
              filename: @firmware.filename)
  end

  # GET /firmwares/new
  def new
    @firmware = Firmware.new
  end

  # GET /firmwares/1/edit
  def edit
  end

  # POST /firmwares
  # POST /firmwares.json
  def create
    @firmware = Firmware.new(firmware_params)
    @firmware.company = current_user.company

    respond_to do |format|
      if @firmware.save
        format.html { redirect_to firmwares_path, notice: 'Firmware was successfully created.' }
        format.json { render :show, status: :created, location: @firmware }
      else
        format.html { render :new }
        format.json { render json: @firmware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firmwares/1
  # PATCH/PUT /firmwares/1.json
  def update
    respond_to do |format|
      if @firmware.update(firmware_params) && firmware_params.has_key?(:file)
        format.html { redirect_to firmwares_path, notice: 'Firmware was successfully updated.' }
        format.json { render :show, status: :ok, location: @firmware }
      else
        format.html { render :edit }
        format.json { render json: @firmware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firmwares/1
  # DELETE /firmwares/1.json
  def destroy
    @firmware.destroy
    respond_to do |format|
      format.html { redirect_to firmwares_url, notice: 'Firmware was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def filter_header
      white_list = %w(CHECKSUM PARTIAL-CHECKSUM)
      response.headers.delete_if{|key| !white_list.include? key}
      response.headers['CHECKSUM'] = Digest::SHA1.hexdigest(@firmware.file_content)
      response.headers['SIZE'] = @firmware.file_content.size
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_firmware
      @firmware = Firmware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firmware_params
      params.require(:firmware).permit(:file, :filename)
    end
end
