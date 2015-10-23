# == Schema Information
# Schema version: 20151023004631
#
# Table name: sites
#
#  id          :integer          not null, primary key
#  name        :string
#  rank        :integer
#  url         :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'nokogiri'
require 'open-uri'

class Site < ActiveRecord::Base
  validates_presence_of :name, :rank, :url
  validates_uniqueness_of :rank, :url

  def self.scrape(url)
    Nokogiri::HTML(open(url))
  end

  def self.scrape_alexa_page(page_num)
    scrape("http://www.alexa.com/topsites/global;#{page_num}")
    .css(".site-listing")
    .each do |s|
      rank = s.at_css(".count").content
      name = s.at_css(".desc-paragraph a").content
      url = s.at_css(".desc-paragraph a[href]").content
      description = s.at_css(".description").content.strip
      Site.find_or_create_by(:rank => rank) do |site|
        # Initiation case
        site.name = name
        site.url = url
        site.description = description
        puts "Created #{name}"
      end.tap do |site|
        # Update / Override stale info case
        site.name = name
        site.url = url
        site.description = description
        puts "Updated #{name}"
      end
    end
  end

  def self.scrape_alexa
    (0..3).each { |page_num| scrape_alexa_page(page_num) }
  end
end
