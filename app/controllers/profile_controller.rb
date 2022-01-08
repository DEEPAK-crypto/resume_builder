class ProfileController < ApplicationController
   def profile
      @profile =  Profile.find( request.query_parameters[:id])
      @user = User.find(@profile.user_id)
      
   end
   
end