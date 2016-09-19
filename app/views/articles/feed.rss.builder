#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "George Web Labs"
    xml.author "George Chang"
    xml.description "George's Blog"
    xml.link "http://georgeweblabs.com/"
    xml.language "zh-TW"

    for article in @articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author article.user.name
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid "http://georgeweblabs.com/articles/" + article.id.to_s
        xml.description markdown article.text
      end
    end
  end
end
