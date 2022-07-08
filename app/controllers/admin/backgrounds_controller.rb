class Admin::BackgroundsController < AdminController
  before_action :set_background, only: [:show, :edit, :update, :destroy]

  # GET /backgrounds
  # GET /backgrounds.json
  def index
    @backgrounds = Background.all
  end

  # GET /backgrounds/1
  # GET /backgrounds/1.json
  def show
  end

  # GET /backgrounds/1/edit
  def edit
  end


  # PATCH/PUT /backgrounds/1
  # PATCH/PUT /backgrounds/1.json
  def update
    respond_to do |format|
      if @background.update(background_params)
        format.html { redirect_to edit_admin_background_url(@background), notice: 'Background was successfully updated.' }
        format.json { render :show, status: :ok, location: @background }
      else
        format.html { render :edit }
        format.json { render json: @background.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background
      @background = Background.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_params
      params.require(:background).permit(:image, :coffee_bean, :review_order,:espresso_based, :manual_brew, :serving_method)
    end
end
