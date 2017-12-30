task :paperclip_import => :environment do
  require "net/http"
  total = Comic.count
  count = 0
  error_count = 0
  errored_strips = []
  Comic.all.each do |comic|
    puts "Processing #{comic.title}"
    count += 1
    if comic.img_url
      encoded_url = URI.encode(comic.img_url)
      url = URI.parse(encoded_url)
      req = Net::HTTP.new(url.host, url.port)
      req.use_ssl = true
      res = req.request_head(url.path)
      if res.code == "200"
        s3_url = comic.img_url
        comic.image = s3_url
        comic.save
        puts "#{comic.title} processed. #{count} of #{total} complete!"
      else
        puts "ERROR! #{comic.title} could not be processed."
        error_count +=1
        errored_strips << comic.title
      end
    end
  end
  puts "Complete!"
  puts "#{error_count} strips errored out:"
  errored_strips.each do |error|
    puts error
  end
end
