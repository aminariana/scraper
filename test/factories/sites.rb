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

FactoryGirl.define do
  factory :site do |f|
    f.name "Google"
    f.rank 1
    f.url "http://www.google.com"
    f.description "Search Engine"
  end
end
