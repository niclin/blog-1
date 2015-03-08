module ApplicationHelper
  def getCustomStrftime(time)
    return time.strftime('%A, %d %B, %Y')
  end
end
