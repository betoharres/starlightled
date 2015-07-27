class LampStat < ActiveRecord::Base
  def to_chart
      {date: date, tLed1: tLed1 || 0, tLed2: tLed2 || 0, tCom: tCom || 0}
  end
end
