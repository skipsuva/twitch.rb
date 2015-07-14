describe TwitchApi::Client::Streams do
  let(:client) { TwitchApi::Client.new }

  describe ".stream", :vcr do
    context 'that is live' do
      it "returns the matching stream" do
        response = client.stream("spencer124816")
        expect(response.stream.game).to eq("Programming")
      end
    end

    context 'that is not live' do
      it "returns the matching stream" do
        response = client.stream("spencer124816")
        expect(response.stream).to eq nil
      end
    end
  end
end
