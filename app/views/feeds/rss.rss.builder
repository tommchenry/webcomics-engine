xml.instruct! :xml, :version => "1.0"
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title "NonCanon"
    xml.description "NonCanon - Comics By Tom McHenry"
    xml.link root_url
    xml.language "en"
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => root_url + "feed.rss"

    @comics.each do |comic|
      xml.item do
        xml.title comic.title
        comic_link = root_url + "comic/" + comic.url_slug
        xml.link comic_link
        xml.description {
          xml.cdata! "<a href='" + comic_link + "'><img src='" + comic.img_url + "'></a>"
        }
        xml.pubDate comic.post_date.to_formatted_s(:rfc822)
        xml.guid comic_link
      end
    end
  end
end
