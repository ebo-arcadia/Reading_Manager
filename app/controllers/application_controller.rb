class ApplicationController < ActionController::Base
    helper_method :current_reader

    def current_reader
        @current_reader ||= Reader.find(session[:reader_id] if session[:reader_id])
    end 
    
end
