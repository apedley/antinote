require 'spec_helper'

describe Share do
  it { expect(build_stubbed(:share)).to be_valid }
  it { expect(build_stubbed(:share, :note => nil)).to_not be_valid }

  it "assigns uuid when created" do
    share = create(:share)
    expect(share.uuid).to_not be_nil
  end

  it "finds stale instances" do
    a_long_time_ago = DateTime.now - 31.days
    a_week_ago = DateTime.now - 7.days 
    old_share = create(:share, :updated_at => a_long_time_ago)
    newer_share = create(:share, :updated_at => a_week_ago)
    expect(Share.stale).to eq([old_share])
  end

  it "tells if it's stale" do
    old_share = create(:share, :updated_at => DateTime.now - 31.days)
    new_share = create(:share, :updated_at => DateTime.now - 10.days)
    expect(old_share.stale?).to be_true
    expect(new_share.stale?).to be_false
  end
end