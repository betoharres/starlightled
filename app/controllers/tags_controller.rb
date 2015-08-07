class TagsController < ApplicationController
  before_filter :require_user_signed_in
  def index
    @tags = current_user.company.owned_tags.order(:name)
  end

  def show
    @tagged_resources = ActsAsTaggableOn::Tagging.all.includes(:tag).where(tagger_id: params[:id])
  end
end
