class Admin::FrontImagesController < AdminController
  before_action :set_front_image, only: [:show, :edit, :update, :destroy]

  # GET /front_images
  # GET /front_images.json
  def index
    @front_images = FrontImage.all
  end

  # GET /front_images/1
  # GET /front_images/1.json
  def show
  end

  # GET /front_images/new
  def new
    @front_image = FrontImage.new
  end

  # GET /front_images/1/edit
  def edit
  end

  # POST /front_images
  # POST /front_images.json
  def create
    @front_image = FrontImage.new(front_image_params)

    respond_to do |format|
      if @front_image.save
        format.html { redirect_to admin_front_images_url, notice: 'Front image was successfully created.' }
        format.json { render :show, status: :created, location: @front_image }
      else
        format.html { render :new }
        format.json { render json: @front_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /front_images/1
  # PATCH/PUT /front_images/1.json
  def update
    respond_to do |format|
      if @front_image.update(front_image_params)
        format.html { redirect_to admin_front_images_url, notice: 'Front image was successfully updated.' }
        format.json { render :show, status: :ok, location: @front_image }
      else
        format.html { render :edit }
        format.json { render json: @front_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /front_images/1
  # DELETE /front_images/1.json
  def destroy
    @front_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_front_images_url, notice: 'Front image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_front_image
      @front_image = FrontImage.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def front_image_params
      params.require(:front_image).permit(:image, :slug, :published, :name)
    end
end
