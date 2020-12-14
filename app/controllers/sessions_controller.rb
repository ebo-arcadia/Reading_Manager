class SessionsController < ApplicationController

    def welcome
        # @current_reader = current_reader
    end 

    def new
        @reader = Reader.new
    end 

    def create
        @reader = Reader.find_by(email: params[:reader][:email])
        if @reader && @reader.authenticate(params[:reader][:password])
            session[:reader_id] = @reader.id
            redirect_to reader_path(@reader)
        else 
            render :new
        end 
    end 

    def destroy
        session.delete :reader_id
        redirect_to login_path
    end 

end
