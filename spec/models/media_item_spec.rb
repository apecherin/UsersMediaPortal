require "rails_helper"

describe MediaItem do
  it "has a valid factory" do
    FactoryGirl.create(:media_item).should be_valid
  end

  it "is invalid without name" do
    FactoryGirl.build(:media_item, name: nil).should_not be_valid
  end
end