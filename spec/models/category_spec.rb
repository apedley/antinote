require 'spec_helper'

describe Category do
  it { expect(build_stubbed(:category)).to be_valid }
  it { expect(create(:category_with_notes).notes.count).to be > 1 }
end