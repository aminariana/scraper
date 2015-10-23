namespace :cron do
  task :scrape_alexa => :environment do
    puts "Scraping Alexa ..."
    Site.scrape_alexa
    puts "Done."
  end
end
