class PagesController < ApplicationController
  def home
    @pins = Pin.where(approved: true).order("updated_at desc").page(params[:page]).per_page(20)
    @admin = user_signed_in?&&current_user.admin?
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
      format.js #home js for endless scroll
    end
  end

  def about
  end

end

# class PagesController < ApplicationController
#   def home
#   	#rules
#   	@pins = Pins.where(approved: true).order("updated_at desc")
# 		@admin = user_signed_in?&&current_user_admin?
#   end

#   def about
#   	#rules
#   end
# end