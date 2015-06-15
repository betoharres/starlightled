class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper

  layout 'pages'

  def create
    super
  end

  def new
    super
  end
end
