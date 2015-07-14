class AuditsController < ApplicationController
  def index
    @logs = Company.find(current_user.company_id).associated_audits.includes(:user).reverse_order
  end

  def show
  end
end
