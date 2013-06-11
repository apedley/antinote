require 'spec_helper'

describe Note do
  it { expect(build_stubbed(:note)).to be_valid }
  it { expect(build_stubbed(:note, :title => nil)).to_not be_valid }
  it { expect(build_stubbed(:note, :body => nil)).to_not be_valid }
  it { expect(build_stubbed(:note, :title => 'a')).to_not be_valid }
  it { expect(build_stubbed(:note, :body => 'a')).to_not be_valid }
  it { expect(build_stubbed(:note, :title => 'a'*300)).to_not be_valid }
  it { expect(build_stubbed(:note)).to respond_to(:category) }

  it "returns preview text" do
    raw_text = "##text"
    preview = Note.preview_text(raw_text)
    expect(preview).to include('<h2>text</h2>')
  end
  
  it "automatically formats text" do
    note = create(:note, :body => '##text')
    expect(note.rendered_body).to include('<h2>text</h2>')
  end

  it "gives the table of contents" do
    text = "##text"
    note = build_stubbed(:note, :body => text )
    expect(note.get_toc).to include('<a href="#toc_0">text</a>')
  end

  it "returns the shortened date of last update" do
    updated = DateTime.parse("2000-01-01 00:00:00").in_time_zone
    note = build_stubbed(:note, :updated_at => updated)
    expect(note.updated_short).to eq('01 Jan 00:00')
  end

  it "gives a body preview" do
    note = create(:note, :body => "##header")
    expect(note.body_preview).to eq('header')
  end

  it "does start with a share" do
    note = create(:note)
    expect(note.share).to be_nil
  end

  it "creates a share when requested if none exists" do
    note = create(:note)
    expect(note.get_share).to be_an_instance_of(Share)
  end

  it "does not create a new share if one exists" do
    note = create(:note)
    share = note.get_share
    expect(note.get_share).to eq(share)
  end
end