class FeaturesController < ApplicationController
  def time
    time = DateTime.now.in_time_zone("Brasilia").to_datetime.to_s
    response.headers['TIME_CHECKSUM'] = Digest::SHA1.hexdigest(time)
    render text: time
  end

  def last_record
    render json: LampStat.where(serial_num: Lamp.find(params[:lamp_id]).product.serial_number).last
  end
end
