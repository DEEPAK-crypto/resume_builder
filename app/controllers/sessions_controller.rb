class SessionsController < ApplicationController
  
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          log_in(user)
          redirect_to(root_path)
      else
          flash.now[:danger] = 'Invalid email/password combination'
          render('new')
      end
  end

  def destroy
      log_out
      redirect_to(root_url)
  end

  def signup
  end
  
  def signupsubmit
        old = User.find_by(email: params[:user][:email])
        if(old)
             flash.now[:danger] = "User already exists"
             render('signup');
        else
            user = User.new({name: params[:user][:name], email:params[:user][:email].downcase, password:params[:user][:password]})
            user.profile = Profile.new
            user.save
            user.profile.educations.create
            
            flash.now[:success] = "Signup Successful please login"
            render('new')
        end
  end 

end
