class Facebook
  class Config
    def self.app_id
      @@app_id ||= ENV['FACEBOOK_APP_ID']
    end
    def self.app_secret
      @@app_secret ||= ENV['FACEBOOK_APP_SECRET']
    end
    def self.app_scope
      @@app_scope ||= ENV['FACEBOOK_APP_SCOPE']
    end
    def self.t8_app_secret
      @@t8_app_secret ||= ENV['T8_APP_SECRET']
    end
  end
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

  def self.parse_signed_request(signed_request, ops = {})
    _, encoded_envelope = signed_request.split('.', 2)
    envelope = MultiJson.decode(base64_url_decode(encoded_envelope))
    if envelope['t8']
      secret = Config.t8_app_secret
    else
      secret = Config.app_secret
    end
    oauth = Koala::Facebook::OAuth.new(Config.app_id, secret)
    SignedRequest.from oauth.parse_signed_request(signed_request)
  end
  # base 64
  # directly from https://github.com/facebook/crypto-request-examples/raw/master/sample.rb
  def self.base64_url_decode(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_', '+/'))
  end
end
