require "rails_helper"

describe Repo do
  it "exists" do
    attributes = {
      name: 'A Great Repo',
      html_url: 'agreatrepourl.test',
      private: true
    }

    repo = Repo.new(attributes)

    expect(repo).to be_a Repo
    expect(repo.name).to eq(attributes[:name])
    expect(repo.url).to eq(attributes[:html_url])
    expect(repo.private?).to eq(attributes[:private])
  end
end
