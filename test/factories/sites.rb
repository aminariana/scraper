FactoryGirl.define do
  factory :site do |f|
    f.name "Google"
    f.rank 1
    f.url "http://www.google.com"
    f.description "Search Engine"
  end
end
