class DashController < ApplicationController
  def index
    render "/app/views/dashboards/#{params[:type]}"
  end

  def widget
    render "/app/widgets/#{params[:type]}/#{params[:type]}", layout:false
  end
end
