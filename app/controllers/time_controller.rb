class TimeController < ApplicationController
  def gmt
    time = DateTime.now.utc.to_s
    response.headers['TIME_CHECKSUM'] = Digest::SHA1.hexdigest(time)
    render text: time
  end

  def timezone
    time = DateTime.now.in_time_zone("Brasilia").to_datetime.to_s
    response.headers['TIME_CHECKSUM'] = Digest::SHA1.hexdigest(time)
    render text: time
  end
end
