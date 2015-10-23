require 'rails_helper'

RSpec.describe Site, type: :model do
  let!(:site) { FactoryGirl.build(:site) }

  it "saves" do
    expect { site.save! }.to change(Site, :count).by(1)
  end
end
