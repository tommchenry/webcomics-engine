require 'csv'
require 'net/http'

ROOT_URL = "noncanon.online"
FILENAME = "ls_comics.csv"

namespace :import do
  desc "imports comics from a basic ls command"
  task :basic_import => :environment do 
    tmp_file_name = "#{Rails.root}/tmp/comics.csv"
    Net::HTTP.start("noncanon.online") do |http|
      resp = http.get("/csv/ls_comics.csv")
      open(tmp_file_name, "wb") do |file|
        file.write(resp.body)
      end
    end
    puts "File Downloaded."
    CSV.foreach(tmp_file_name) do |csv|
      img_url = "http://www.noncanon.online/comics/" + csv[0]
      date_regex = /\d\d\d\d-\d\d-\d\d\s/
      title = File.basename(csv[0], ".png").gsub(date_regex, "")
      post_date = DateTime.parse(csv[0][date_regex])
      Comic.create!(title: title, img_url: img_url, post_date: post_date, visible: true)
    end
    puts "File Imported."
  end
end

task :dropbox_import => :environment do
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

task :noncanon_import => :environment do
  tmp_file_name = "#{Rails.root}/tmp/noncanon_comics.csv"
  Net::HTTP.start("noncanon.com") do |http|
    resp = http.get("/fullnoncanonstrips.csv")
    open(tmp_file_name, "wb") do |file|
      file.write(resp.body)
    end
  end
  puts "File Downloaded."
  CSV.foreach(tmp_file_name) do |csv|
    title = csv[0]
    alt_text = csv[1]
    post_date =  DateTime.strptime(csv[2], '%m/%d/%Y %I:%M:%S' )
    img_url = File.join(ROOT_URL, csv[3])
    Comic.create!(title: title, img_url: img_url, post_date: post_date, alt_text: alt_text,  visible: true)
  end
  puts "File Imported."
end

task :noncanon_bulk_rename => :environment do
  tmp_source_dir = "/Users/tom/Desktop/oldcomics/"
  tmp_file_name = "#{Rails.root}/tmp/noncanon_comics.csv"
  Net::HTTP.start("noncanon.com") do |http|
    resp = http.get("/fullnoncanonstrips.csv")
    open(tmp_file_name, "wb") do |file|
      file.write(resp.body)
    end
  end
  puts "File Downloaded."
  counter = 0
  CSV.foreach(tmp_file_name) do |csv|
    counter += 1
    title = csv[0].split[0...2].join(' ')
    post_date =  DateTime.strptime(csv[2], '%m/%d/%Y %I:%M:%S' )
    file_name = post_date.strftime("%Y-%m-%d #{title}")
    extension = File.exists?("#{tmp_source_dir}#{counter}.gif") ? ".gif" : ".jpg"
    source_file = counter.to_s + extension
    destination_file = file_name + extension
    puts "Rename #{source_file} to #{destination_file}"
    File.rename(tmp_source_dir + source_file, tmp_source_dir + destination_file)
  end
end
