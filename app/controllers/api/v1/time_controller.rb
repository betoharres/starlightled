module Api
  module V1
    class TimeController < BaseController
      before_action :authenticate_gateway!
      before_action :filter_headers

      def gmt
        time = DateTime.now.utc.to_s
        env['rack.session.options'][:skip] = true
        response.headers['TIME_CHECKSUM'] = Digest::SHA1.hexdigest(time)
        render text: time
      end

      def timezone
        time = DateTime.now.in_time_zone("Brasilia").to_datetime.to_s
        response.headers['TIME_CHECKSUM'] = Digest::SHA1.hexdigest(time)
        render text: time
      end

      def filter_headers
        white_list = %w(access-token client expiry uid token-type)
        response.headers.delete_if{|key| !white_list.include?(key)}
      end

    end
  end
end
