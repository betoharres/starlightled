class ConfigFilesController < ApplicationController
  before_action :set_config_file, only: [:show, :edit, :update, :destroy]

  # GET /config_files
  # GET /config_files.json
  def index
    @config_files = ConfigFile.all
  end

  # GET /config_files/1
  # GET /config_files/1.json
  def show
  end

  # GET /config_files/new
  def new
    @config_file = ConfigFile.new
  end

  # GET /config_files/1/edit
  def edit
    @config_file.content = @config_file.content.to_json
  end

  # POST /config_files
  # POST /config_files.json
  def create
    @config_file = ConfigFile.new(config_file_params)
    @config_file.company = current_user.company
    @config_file.version = @config_file.content["prog"]["ver"]

    respond_to do |format|
      if @config_file.save
        format.html { redirect_to @config_file, notice: 'Configuração foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @config_file }
      else
        format.html { render :new }
        format.json { render json: @config_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_files/1
  # PATCH/PUT /config_files/1.json
  def update
    respond_to do |format|
      if @config_file.update(config_file_params)
        format.html { redirect_to @config_file, notice: 'Configuração foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @config_file }
      else
        format.html { render :edit }
        format.json { render json: @config_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_files/1
  # DELETE /config_files/1.json
  def destroy
    @config_file.destroy
    respond_to do |format|
      format.html { redirect_to config_files_url, notice: 'Configuração foi apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_file
      @config_file = ConfigFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_file_params
      params.require(:config_file).permit(:content, :name, :version)
    end
end
