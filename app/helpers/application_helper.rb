# frozen_string_literal: true

module ApplicationHelper
  # Removed the markdown method

  # Helper method to check if the current user is an admin
  def admin?
    # Assuming admin status is determined by the presence of an Admin record
    # matching the session's user ID, similar to check_admin_permission
    # Note: Ensure the Admin model exists and this logic matches your authentication setup.
    # Also ensure session[:current_user_id] is correctly set upon login.
    # Return false if no user is logged in.
    return false unless session[:current_user_id]

    Admin.exists?(id: session[:current_user_id])
  rescue NameError
    # Handle case where Admin model might not exist (optional, for robustness)
    Rails.logger.error "Admin model not found. Cannot perform admin check."
    false
  end
end
