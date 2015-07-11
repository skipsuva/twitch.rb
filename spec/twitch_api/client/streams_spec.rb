describe TwitchApi::Client::Streams do
  describe ".stream", :vcr do
    context 'that is live' do
      it "returns the matching stream" do
        stream = @client.stream("#spencer1248")
        expect(stream.game).to eq("Programming")
        assert_requested :get, twitch_url("/kraken/streams/Spencer124816")
      end
    end
  end
end
