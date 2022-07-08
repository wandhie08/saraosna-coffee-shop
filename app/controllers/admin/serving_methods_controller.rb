class Admin::ServingMethodsController < AdminController
  before_action :set_admin_serving_method, only: [:show, :edit, :update, :destroy]

  # GET /admin/serving_methods
  # GET /admin/serving_methods.json
  def index
    @serving_methods = ServingMethod.order(created_at: :desc)
  end

  # GET /admin/serving_methods/1
  # GET /admin/serving_methods/1.json
  def show
  end

  # GET /admin/serving_methods/new
  def new
    @serving_method = ServingMethod.new
  end

  # GET /admin/serving_methods/1/edit
  def edit
  end

  # POST /admin/serving_methods
  # POST /admin/serving_methods.json
  def create
    @serving_method = ServingMethod.new(admin_serving_method_params)

    respond_to do |format|
      if @serving_method.save
        format.html { redirect_to admin_serving_methods_url, notice: 'Serving method was successfully created.' }
        format.json { render :show, status: :created, location: @serving_method }
      else
        format.html { render :new }
        format.json { render json: @serving_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/serving_methods/1
  # PATCH/PUT /admin/serving_methods/1.json
  def update
    respond_to do |format|
      if @serving_method.update(admin_serving_method_params)
        format.html { redirect_to admin_serving_methods_url, notice: 'Serving method was successfully updated.' }
        format.json { render :show, status: :ok, location: @serving_method }
      else
        format.html { render :edit }
        format.json { render json: @serving_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/serving_methods/1
  # DELETE /admin/serving_methods/1.json
  def destroy
    @serving_method.destroy
    respond_to do |format|
      format.html { redirect_to admin_serving_methods_url, notice: 'Serving method was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_serving_method
      @serving_method = ServingMethod.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_serving_method_params
      params.require(:serving_method).permit(:name, :image, :description, :visible, :notes)
    end
end
