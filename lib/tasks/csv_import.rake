require 'csv'

ROOT_URL = "http://www.noncanon.com/comics/"

task :dropbox_import do
  CSV.foreach("/Users/tom/Desktop/comics.csv") do |csv|
    post_date = DateTime.parse(csv[0])
    img_url = ROOT_URL + csv[1]
    title = File.basename(csv[1], ".png").gsub(/\d\d\d\d-\d\d-\d\d\s/, "")
    Comic.create!(title: title, img_url: img_url, post_date: post_date, visible: true)
  end
end

