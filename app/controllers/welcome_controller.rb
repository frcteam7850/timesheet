class WelcomeController < ApplicationController
  skip_before_filter :must_be_admin, only: :index
  def index
  	@hour_exception = HourException.new
  	@flex_hour = FlexHour.new
  end
  def acknowledgements
  end
end
