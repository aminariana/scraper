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
    doc = Nokogiri::HTML(open(url))
  end
end
