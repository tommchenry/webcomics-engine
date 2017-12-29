ORIGINAL_URL = "http://www.noncanon.online/"
NEW_URL = "https://s3.amazonaws.com/noncanon-comics/"

task :url_update => :environment do
  Comic.all.each do |comic|
    comic.img_url.gsub!(ORIGINAL_URL, NEW_URL)
    comic.save
    puts comic.img_url
  end
end
