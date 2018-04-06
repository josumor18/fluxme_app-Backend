class HomeController < ApplicationController
	before_action :authenticate_user!, raise: false
  def index
  	
  end
end
