module LampStatsHelper
  def formatted_seconds(total_seconds)
    hours = total_seconds / (60 * 60)
    minutes = (total_seconds / 60) % 60
    seconds = total_seconds % 60

    format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
