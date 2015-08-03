class FeaturesController < ApplicationController
  def time
    render text: DateTime.now.in_time_zone("Brasilia").to_datetime.to_s
  end

  def last_record
    render json: LampStat.last
  end
end
