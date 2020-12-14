class SessionsController < ApplicationController

    def welcome
        # @current_reader = current_reader
    end 

    def new
        @reader = Reader.new
    end 

    def create
        # raise params.inspect
        @reader = Reader.find_by(email: params[:reader][:email])
        if @reader && @reader.authenticate(params[:reader][:password])
            session[:reader_id] = @reader.id
            redirect_to reader_path(@reader)
        else 
            # flash[:message] = "login credential is incorrect"
            render :new
        end 
    end 

    def destroy
        session.delete :reader_id
        redirect_to root_path
    end 

end
