class LandingsController < ApplicationController
  before_filter :require_user_signed_in
  def index
  end
end
