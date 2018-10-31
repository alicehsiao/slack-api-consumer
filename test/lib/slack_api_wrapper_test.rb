require 'test_helper'

describe SlackApiWrapper do
  it "can list channels" do
    # the name of the cassette 'channel' is arbitrary
    VCR.use_cassette('list_channels_file') do
      channels = SlackApiWrapper.list_channels

      expect(channels.length).must_be :>, 0
      channels.each do |channel|
        expect(channel).must_respond_to :name
        expect(channel).must_respond_to :id
      end
    end
  end

  it "can send messages to valid channels" do
    VCR.use_cassette('send_msg') do
      worked = SlackApiWrapper.send_msg('nodes-api-testing', "THIS IS ALICE IN TESTING")

      expect(worked).must_equal true
    end
  end

  it "cannot send messages to invalid channels" do
    VCR.use_cassette('send_msg') do
      worked = SlackApiWrapper.send_msg('bogus_api', "THIS IS ALICE IN TESTING")

      expect(worked).must_equal false
    end
  end
end
