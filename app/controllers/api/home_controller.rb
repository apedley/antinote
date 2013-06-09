module Api
  class HomeController < ApplicationController

    def error
      render :json => { :result => 'error', :details => params[:error].to_json }
    end
  end
end