class SessionsController < ApplicationController

    def new
    end
  
    def create
      
      if User.find_by(email: params[:session][:email].downcase) && (User.find_by(email: params[:session][:email].downcase).password == params[:session][:password])
        user = User.find_by(email: params[:session][:email].downcase)
        sign_in(user,"user");
        redirect_to user
      elsif Agent.find_by(email: params[:session][:email].downcase) && (Agent.find_by(email: params[:session][:email].downcase).password == params[:session][:password])
        agent = Agent.find_by(email: params[:session][:email].downcase)
        sign_in agent,"agent";
        redirect_to agent
      else
        flash[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
      
    end
  
    def destroy
      sign_out
      redirect_to root_url
    end
  end