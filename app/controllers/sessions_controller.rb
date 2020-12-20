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
        #     reader.username = auth['info']['first_name']
        #     reader.password = SecureRandom.hex
        # end 
        
        #method 2
        # @reader = Reader.find_or_create_by(email: auth['info']['email']) do |reader|
        #     reader.username = auth['info']['first_name']
        #     reader.password = SecureRandom.hex
        # end

        # method 3
        reader = Reader.find_or_create_by_omniauth(auth)
        session[:reader_id] = reader.id
        redirect_to reader_path(reader)
        binding.pry
        # if @reader.save
        #     session[:reader_id] = @reader.id
        #     redirect_to reader_path(@reader)
        # else
        #     redirect_to root_path
        # end 
    end 

    def auth
        request.env['omniauth.auth']
    end 

    def destroy
        session.delete :reader_id
        redirect_to root_path
    end 

end
