require 'test_helper'

describe Channel do
  it "cannot be initialized with less than 2 parameters" do
    expect {
      Channel.new
    }.must_raise ArgumentError

    expect {
      Channel.new("name")
    }.must_raise ArgumentError
  end

  it "must initialize name and id properly" do
    channel = Channel.new("Name", "ID")

    expect(channel.name).must_equal "Name"
    expect(channel.id).must_equal "ID"
  end

  it "will initialize the defaults if not given parameters for purpose, is_archived, and members" do
    channel = Channel.new("Name", "ID")

    expect(channel.purpose).must_equal ""
    expect(channel.is_archived).must_equal false
    expect(channel.members).must_equal []
  end

  it "will the defaults if not given parameters for the purpose, is_archived, OR members" do
    channel = Channel.new("Name", "ID", purpose: "Chat", members: [1, 4, 5])

    expect(channel.purpose).must_equal "Chat"
    expect(channel.is_archived).must_equal false
    expect(channel.members).must_equal [1, 4, 5]
  end
end
