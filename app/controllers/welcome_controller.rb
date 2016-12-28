class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end
end

# use on app controllers (before_action :authenticate_user!)
