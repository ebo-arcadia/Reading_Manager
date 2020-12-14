class ApplicationController < ActionController::Base
    helper_method :current_reader, :logged_in?

    def current_reader
        @current_reader ||= Reader.find(session[:reader_id]) if session[:reader_id]
    end 

    def logged_in?
        !!session[:reader_id]
    end

    # def redirect_if_not_logged_in
    #     redirect_to '/ if !logged_in?
    # end 

end
