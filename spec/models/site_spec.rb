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

require 'rails_helper'

RSpec.describe Site, type: :model do
  let!(:site) { FactoryGirl.build(:site) }

  it "saves" do
    expect { site.save! }.to change(Site, :count).by(1)
  end

  it "scrapes any url" do
    Site.scrape("http://www.google.com").css("title").each do |title|
      expect(title.content).to eq "Google"
    end
  end

  it "scrapes Alexa page" do
    expect{ Site.scrape_alexa_page(0) }.to change(Site, :count).by(25)
    expect{ Site.scrape_alexa_page(0) }.to change(Site, :count).by(0)
    expect{ Site.scrape_alexa_page(1) }.to change(Site, :count).by(25)
  end

  it "scrapes Alexa top 100" do
    expect{ Site.scrape_alexa }.to change(Site, :count).by(100)
    expect{ Site.scrape_alexa }.to change(Site, :count).by(0)
  end
end
