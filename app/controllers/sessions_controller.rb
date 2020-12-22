class SessionsController < ApplicationController

    def welcome
        # @current_reader = current_reader
    end 

    def new
        @reader = Reader.new
    end 

    def create
        @reader = Reader.find_by(email: params[:email])
        if @reader && @reader.authenticate(params[:password])
            session[:reader_id] = @reader.id
            redirect_to reader_path(@reader)
        else 
            flash[:message] = 'Incorrect log in. Please try again.'
            redirect_to '/login'
        end 
    end 

    def google
        # method 1
        # @reader = Reader.where(email: auth['info']['email']).first_or_create do |reader|
        #     reader.username = auth['info']['name']
        #     reader.password = SecureRandom.hex
        # end 
        # if @reader.save
        #     session[:reader_id] = @reader.id
        #     redirect_to reader_path(@reader)
        # else
        #     redirect_to root_path
        # end 
        
        # method 2
        # @reader = Reader.find_or_create_by(email: access_token['info']['email']) do |reader|
        #     reader.username = access_token['info']['first_name']
        #     reader.password = SecureRandom.hex
        # end
       
        # if @reader.save
        #     session[:reader_id] = @reader.id
        #     redirect_to reader_path(@reader)
        # else
        #     redirect_to root_path
        # end 
      
        # method 3
        @reader = Reader.find_or_create_by_omniauth(access_token)
            session[:reader_id] = @reader.id
            redirect_to reader_path(@reader)
    end 

    def access_token
        request.env['omniauth.auth']
    end 

    def destroy
        session.delete :reader_id
        redirect_to root_path
    end 

end
