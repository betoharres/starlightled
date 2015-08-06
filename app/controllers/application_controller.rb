class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  private

  def deny_access
    # If the user came from a page, we can send them back.  Otherwise, send
    # them to the root path.
    if request.env['HTTP_REFERER']
      fallback_redirect = new_user_session_path # :back
    elsif defined?(root_path)
      fallback_redirect = new_user_session_path # root_path
    else
      fallback_redirect = new_user_session_path # "/"
    end

    redirect_to fallback_redirect, flash: {error: "You must be in signed or have permissions to view this page."}
  end

  def require_user_signed_in
    if !user_signed_in?
      deny_access
    # else
    #   if role = current_user.role
    #     # TODO move the modification to an initializer with all the models in a array
    #     model_name = params[:controller].gsub(/Controller/, '').singularize.capitalize
    #     ability_number = Permission.abilities[role.permissions.where(
    #       resource: model_name).last.ability]
    #       case params[:action]
    #         when 'index'
    #           deny_access if ability_number < 8
    #         when 'show'
    #           deny_access if ability_number < 8
    #         when 'new'
    #           deny_access unless [12, 13, 14, 15].include?(ability_number)
    #         when 'create'
    #           deny_access unless [12, 13, 14, 15].include?(ability_number)
    #         when 'edit'
    #           deny_access unless [10, 11, 14, 15].include?(ability_number)
    #         when 'update'
    #           deny_access unless [10, 11, 14, 15].include?(ability_number)
    #         when 'destroy'
    #           deny_access unless [9, 11, 13, 15].include?(ability_number)
    #       end
    #   else
    #     deny_access
    #   end
    end
  end
end
