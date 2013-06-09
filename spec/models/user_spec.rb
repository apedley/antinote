require 'spec_helper'

describe User do
  it { expect(build_stubbed(:user)).to be_valid }
  it { expect(build_stubbed(:user, password: nil)).to_not be_valid }
  it { expect(build_stubbed(:user, password_confirmation: nil)).to_not be_valid }
  it { expect(build_stubbed(:user, password: 'abcde')).to_not be_valid }
  it { expect(build_stubbed(:user, password: 'abcde'*5)).to_not be_valid }


  it "should automatically generate a token" do
    expect(create(:user).auth_token).to_not be_nil
  end

  it "should create password digest" do
    expect(create(:user).password_digest).to_not be_nil
  end
end