class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email

      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(name: auth.info.name.gsub(/\s+/, '_'),
                        email: auth.info.email,
                        password: Devise.friendly_token[0,20])
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def delete_access_token(auth)
    @graph ||= Koala::Facebook::API.new(auth.credentials.token)
    @graph.delete_connections(auth.uid, "permissions")
  end
  def comfirm?
    is_comfirm
  end

  def to_confirm
    self.update_columns(is_comfirm: true)
  end

  def to_unconfirmed
    self.update_columns(is_comfirm: false)
  end

  def admin?
    is_admin
  end

  def to_admin
    self.update_columns(is_admin: true)
  end

  def to_user
    self.update_columns(is_admin: false)
  end
end
