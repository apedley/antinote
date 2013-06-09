require 'spec_helper'

describe Note do
  it { expect(build_stubbed(:note)).to be_valid }
  it { expect(build_stubbed(:note, :title => nil)).to_not be_valid }
  it { expect(build_stubbed(:note, :body => nil)).to_not be_valid }
  it { expect(build_stubbed(:note, :title => 'a')).to_not be_valid }
  it { expect(build_stubbed(:note, :body => 'a')).to_not be_valid }
  it { expect(build_stubbed(:note, :title => 'a'*300)).to_not be_valid }
  
  it "returns preview text" do
    raw_text = "##text"
    preview = Note.preview_text(raw_text)
    expect(preview).to include('<h2>text</h2>')
  end
  
  it "should automatically format text" do
    note = create(:note, :body => '##text')
    expect(note.rendered_body).to include('<h2>text</h2>')
  end
end