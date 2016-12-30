xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "NonCanon"
    xml.author "Tom McHenry"
    xml.description "NonCanon - Comics By Tom McHenry"
    xml.link root_url
    xml.language "en"

    @comics.each do |comic|
      xml.item do
        xml.title comic.title
        xml.author "Tom McHenry"
        xml.pubDate comic.post_date.to_s
        xml.link root_url + "/comic/" + comic.url_slug
        xml.image_url comic.img_url
        xml.media(:content, :url => comic.img_url, :medium => "image")
      end
    end
  end
end