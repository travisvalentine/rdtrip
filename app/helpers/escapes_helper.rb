module EscapesHelper
	def playback_token_tag
    if Rails.env.production?
    	tag('meta', name: 'playback_token', content: RDIO.getPlaybackToken(domain: "rdtrip.in"))
    else
    	tag('meta', name: 'playback_token', content: RDIO.getPlaybackToken(domain: "localhost"))
    end
  end

  def yahoo_app_id
  	if Rails.env.production?
  		tag('meta', name: 'yahoo_id', content: ENV['YAHOO_GEO_ID'])
  	else
  		tag('meta', name: 'yahoo_id', content: YAHOO_GEO_ID)
  	end
  end

end
