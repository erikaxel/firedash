class DashboardController < ApplicationController
  def index
    render file: "/app/views/dashboard/#{params[:type]}"
  end

  def widget
    render file: "/app/widgets/#{params[:type]}/#{params[:type]}", layout:false
  end
end
