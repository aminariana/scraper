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
    doc = Site.scrape("http://www.google.com")
    doc.css("title").each do |title|
      expect(title.content).to eq "Google"
    end
  end
end
