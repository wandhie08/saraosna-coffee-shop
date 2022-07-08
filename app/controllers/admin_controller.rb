class AdminController < ApplicationController
  include Pagy::Backend
  layout 'admin'
  before_action :authenticate_admin!

end
