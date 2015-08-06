class TagsController < ApplicationController
  before_filter :require_user_signed_in
  def index
    @tags = ActsAsTaggableOn::Tag.all.order(:name)
  end

  def show
    @tagged_resources = ActsAsTaggableOn::Tag.find(params[:id]).taggings
  end

end
