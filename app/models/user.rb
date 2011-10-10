class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable
  attr_accessible :facebook_user_id, :facebook_profile, :facebook_params
  def self.from_signed_request(signed_request)
    user_id = signed_request[:user_id]
    instance = User.where(facebook_user_id: user_id).first
    return instance if instance
    api = Koala::Facebook::GraphAPI.new
    object = api.get_object(user_id)
    User.create!(facebook_user_id: user_id,
                   facebook_profile: object)
  end
  def self.deauthorize(user_id)
    user = self.where(facebook_user_id: user_id).first
    user.destroy if user
  end
  serialize :facebook_profile, Hash
  def facebook
    @facebook ||= Facebook.new(profile: facebook_profile)
  end
  def encrypted_password=(value)
    # nothing to do
  end
  def encrypted_password
    #nothing to do
  end
  def facebook_params=(params)
    self[:facebook_profile] = build_facebook_profile_from_object(params)
  end
  private
  def build_facebook_profile_from_object(params)
    object = params[:object]
    credentials = params[:credentials]
    {
        'provider' => 'facebook',
        'uid' => object['id'],
        'credentials' => {
            'token' => credentials
        },
        'user_info' => {
            'nickname' => object['username'],
            'email' => object['email'],
            'first_name' => object['first_name'],
            'last_name' => object['last_name'],
            'name' => object['name'],
            'image' => "http://graph.facebook.com/#{object['id']}/picture?type=square",
            'urls' => {
                'Facebook' => object['link'],
                'Website' => nil
            }
        },
        'extra' => {
            'user_hash' => object
        }
    }
  end
end
