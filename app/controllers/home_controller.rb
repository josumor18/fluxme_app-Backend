class HomeController < ApplicationController
	before_action :authenticate_with_http_digest#authenticate_user!
  def index
  	
  end
end
