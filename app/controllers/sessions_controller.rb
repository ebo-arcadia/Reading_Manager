class SessionsController < ApplicationController

    def welcome
        # @current_reader = current_reader
    end 

    def new
        @reader = Reader.new
    end 

    def create
        # raise params.inspect
        @reader = Reader.find_by(email: params[:email])
        if @reader && @reader.authenticate(params[:password])
            session[:reader_id] = @reader.id
            redirect_to reader_path(@reader)
        else 
            redirect_to '/login'
        end 
    end 

    def destroy
        session.delete :reader_id
        redirect_to root_path
    end 

end
