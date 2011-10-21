class ApplicationController < ActionController::Base
  protect_from_forgery
  include FrontendHelpers::Html5Helper

  # # For ajax requests, remember this:
  # # https://github.com/plataformatec/devise/wiki/How-To:-Create-a-guest-user
  # # skip_before_filter :verify_authenticity_token, :only => [:name_of_your_action]

  # # if user is logged in, return current_user, else return guest_user
  # def current_or_guest_user
    # if current_user
      # if session[:guest_user_id]
        # logging_in
        # guest_user.destroy
        # session[:guest_user_id] = nil
      # end
      # current_user
    # else
      # guest_user
    # end
  # end

  # # find guest_user object associated with the current session,
  # # creating one as needed
  # def guest_user
    # User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  # end

  # # called (once) when the user logs in, insert any code your application needs
  # # to hand off from guest_user to current_user.
  # def logging_in
  # end

  # private
  # def create_guest_user
    # u = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(99)}@email_address.com")
    # u.save(false)
    # u
  # end


  protected

  # Override Devise method. Enables redirection in nested paths when top level
  # Devise resource is not available. You can then write paths like
  # 
  #     new_user_contactings_path(current_user || '_')
  #
  # whithout a current_employer and still be redirected correctly on sign in.
  #
  def stored_location_for(resource_or_scope)
    binding.pry
    if path = super
      plural = devise_mapping.scoped_path
      id = send("current_#{devise_mapping.singular}").id
      path.gsub!("#{plural}/_", "#{plural}/#{id}")
    end
  end

  
end
