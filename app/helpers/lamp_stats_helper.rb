module LampStatsHelper
  def formatted_seconds(total_seconds)
    hours = total_seconds / (60 * 60)
    minutes = (total_seconds / 60) % 60
    seconds = total_seconds % 60

    "#{ hours }:#{ minutes }:#{ seconds }"
  end
end
