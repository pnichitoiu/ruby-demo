require 'csv'
require 'uri'

namespace :ecommerce do
  desc 'This task is used to seed the database'
  task import_apparel: :environment do
    files = Dir["lib/tasks/seed/**/*"]
    files.each do |filepath|
      CSV.foreach(filepath, headers: true) do |row|
        next if row[1].to_s.empty?
        url = row[24].to_s
        name = URI.parse(url).path
        filename = File.basename(name)
        file = URI.open(url)
        Product.create(name: row[1], url_key: row[0], description: row[2], sku: row[0], price: row[19], status: 1)
        Product.last.image.attach(io: file, filename: filename, content_type: 'image/jpg')
      end
    end
  end
end
