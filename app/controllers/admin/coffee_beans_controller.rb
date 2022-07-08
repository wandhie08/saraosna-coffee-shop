class Admin::CoffeeBeansController < AdminController
  before_action :set_coffee_bean, only: [:show, :edit, :update, :destroy]

  # GET /coffee_beans
  # GET /coffee_beans.json
  def index
    @coffees = CoffeeBean.order(created_at: :desc)
  end

  # GET /coffee_beans/1
  # GET /coffee_beans/1.json
  def show
  end

  # GET /coffee_beans/new
  def new
    @coffee_bean = CoffeeBean.new
  end

  # GET /coffee_beans/1/edit
  def edit
  end

  # POST /coffee_beans
  # POST /coffee_beans.json
  def create
    @coffee_bean = CoffeeBean.new(coffee_bean_params)

    respond_to do |format|
      if @coffee_bean.save
        format.html { redirect_to admin_coffee_beans_url, notice: 'Coffee bean was successfully created.' }
        format.json { render :show, status: :created, location: @coffee_bean }
      else
        format.html { render :new }
        format.json { render json: @coffee_bean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_beans/1
  # PATCH/PUT /coffee_beans/1.json
  def update
    respond_to do |format|
      if @coffee_bean.update(coffee_bean_params)
        format.html { redirect_to admin_coffee_beans_url, notice: 'Coffee bean was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffee_bean }
      else
        format.html { render :edit }
        format.json { render json: @coffee_bean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_beans/1
  # DELETE /coffee_beans/1.json
  def destroy
    @coffee_bean.destroy
    respond_to do |format|
      format.html { redirect_to admin_coffee_beans_url, notice: 'Coffee bean was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_bean
      @coffee_bean = CoffeeBean.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_bean_params
      params.require(:coffee_bean).permit(:name, :image, :description, :visible, :stock, :available_at, :serving_recommendation_id, :is_recommendation, :kind_of_coffee, :area, :elevation, :varietas, :process, :notes)
    end
end
