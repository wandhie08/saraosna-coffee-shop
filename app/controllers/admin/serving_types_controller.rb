class Admin::ServingTypesController < AdminController
  before_action :set_serving_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/serving_types
  # GET /admin/serving_types.json
  def index
    case params[:type]
    when 'manual-brew'
      @q = ServingType.manual_brew.order_by_name.ransack(params[:q])
      @serving_types = @q.result
    when 'espresso-based'
      @q = ServingType.espresso_based.order_by_name.ransack(params[:q])
      @serving_types = @q.result
    else
      logger.info("==== no params =====")
      @q = ServingType.all.order_by_name.ransack(params[:q])
      @serving_types = @q.result
    end
  end

  # GET /admin/serving_types/1
  # GET /admin/serving_types/1.json
  def show
  end

  # GET /admin/serving_types/new
  def new
    @serving_type = ServingType.new
  end

  # GET /admin/serving_types/1/edit
  def edit
  end

  # POST /admin/serving_types
  # POST /admin/serving_types.json
  def create
    @serving_type = ServingType.new(serving_type_params)

    respond_to do |format|
      if @serving_type.save
        format.html { redirect_to admin_serving_types_url, notice: 'Serving type was successfully created.' }
        format.json { render :show, status: :created, location: @serving_type }
      else
        format.html { render :new }
        format.json { render json: @serving_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/serving_types/1
  # PATCH/PUT /admin/serving_types/1.json
  def update
    respond_to do |format|
      if @serving_type.update(serving_type_params)
        format.html { redirect_to admin_serving_types_url, notice: 'Serving type was successfully updated.' }
        format.json { render :show, status: :ok, location: @serving_type }
      else
        format.html { render :edit }
        format.json { render json: @serving_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/serving_types/1
  # DELETE /admin/serving_types/1.json
  def destroy
    @serving_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_serving_types_url, notice: 'Serving type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serving_type
      @serving_type = ServingType.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serving_type_params
      params.require(:serving_type).permit(:name, :image, :slug, :serving_method_id, :description, :bean, :result, :color, :is_recommendation, :visible, :notes)
    end
end
