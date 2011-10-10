class Facebook
  class Profile
    class Hash < HashWithMethod
    end
  end
  class SignedRequest < HashWithMethod
    def t8_request?
      self['t8'] ? true : false
    end
    def liked?
    end
    def admin?
    end
    def who
    end
  end
  def initialize(profile_hash)
    @profile = Profile::Hash.from(profile_hash[:profile])
  end
  def profile; @profile end

  def public_graph
    @public_graph ||= Koala::Facebook::GraphAPI.new
  end
  def private_graph
    @private_graph ||= Koala::Facebook::GraphAPI.new self.profile.credentials.token
  end

  def self.public_graph
    @@public_graph ||= Koala::Facebook::GraphAPI.new
  end

  def self.parse_signed_request(signed_request, app)
    _, encoded_envelope = signed_request.split('.', 2)
    # envelope = MultiJson.decode(base64_url_decode(encoded_envelope))
    oauth = Koala::Facebook::OAuth.new(app.app_id, app.app_secret)
    SignedRequest.from oauth.parse_signed_request(signed_request)
  end
  # base 64
  # directly from https://github.com/facebook/crypto-request-examples/raw/master/sample.rb
  def self.base64_url_decode(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_', '+/'))
  end
end
