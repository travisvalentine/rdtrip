module EscapesHelper
	def playback_token_tag
    if Rails.env.production?
    	tag('meta', name: 'playback_token', content: RDIO.getPlaybackToken(domain: "rdtrip.in"))
    else
    	tag('meta', name: 'playback_token', content: RDIO.getPlaybackToken(domain: "localhost"))
    end
  end
end
