class FeaturesController < ApplicationController
  def time
    render text: Time.now
  end

  def last_record
    render json: LampStat.last
  end
end
