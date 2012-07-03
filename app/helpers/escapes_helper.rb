module EscapesHelper
	def playback_token_tag
    tag('meta', name: 'playback_token', content: RDIO.getPlaybackToken(domain: "localhost:3000"))
  end
end
