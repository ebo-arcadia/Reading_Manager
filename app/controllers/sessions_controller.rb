class SessionsController < ApplicationController

    def welcome
        # @current_reader = current_reader
    end 

    def new
        @reader = Reader.new
    end 

    def create
        if auth_hash = request.env["omniauth.auth"]
            reader = Reader.find_or_create_by_omniauth(auth_hash)
            session[:reader_id] = @reader.id
            redirect_to root_path
        else 
            @reader = Reader.find_by(email: params[:email])
            if @reader && @reader.authenticate(params[:password])
                session[:reader_id] = @reader.id
                redirect_to reader_path(@reader)
            else 
                flash[:message] = 'Incorrect log in. Please try again.'
                redirect_to '/login'
            end 
        end 
    end 

    def destroy
        session.delete :reader_id
        redirect_to root_path
    end 

end
