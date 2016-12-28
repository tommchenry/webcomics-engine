require 'csv'
require 'net/http'

ROOT_URL = "http://www.noncanon.com/comics/"

task :dropbox_import do
  tmp_file_name = "#{Rails.root}/tmp/db_comics.csv"
  Net::HTTP.start("noncanon.com") do |http|
    resp = http.get("/db_comics.csv")
    open(tmp_file_name, "wb") do |file|
      file.write(resp.body)
    end
  end
  puts "File Downloaded."
  CSV.foreach(tmp_file_name) do |csv|
    post_date = DateTime.parse(csv[0])
    img_url = ROOT_URL + csv[1]
    title = File.basename(csv[1], ".png").gsub(/\d\d\d\d-\d\d-\d\d\s/, "")
    Comic.create!(title: title, img_url: img_url, post_date: post_date, visible: true)
  end
  puts "File Imported."
end

