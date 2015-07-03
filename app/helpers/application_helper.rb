module ApplicationHelper
  def getCustomStrftime(time)
    return time.strftime('%A, %d %B, %Y')
  end
  def content_title(subtitle)
    content_for :title, subtitle + " - George Web Labs"
  end
end
