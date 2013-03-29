class UsersController < ApplicationController
	def show
	@user = User.find(params[:id])
	@pins = @user.pins
	end
end

