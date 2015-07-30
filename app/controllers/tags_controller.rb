class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all.order(:name)
  end

  def show
    @tagged_resources = ActsAsTaggableOn::Tag.find(params[:id]).taggings
  end

end
