class JobsController < InheritedResources::Base

  def show
    redirect_to [current_user, resource] if resource.user == current_user
  end
  
end
