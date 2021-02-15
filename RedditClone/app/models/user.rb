class User < ApplicationRecord
    validates :username, :session_token, uniqueness: true, presence: true 
    validates :password_digest, presence: true 
    validates :password, length: {mininum: 6, allow_nil: true}

    attr_reader :password  

    before_validation :ensure_session_token 

    has_many :subs
        foreign_key: :user_id
        class_name: :Sub

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password) 
    end

    def check_password?(password) 
        potato = BCrypt::Password.new(self.password_digest)
        potato.is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by_username(username) 
        if user && user.check_password?(password)
            user
        else
            nil
        end
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.base64 
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64 
        self.save! 
        self.session_token
    end
end
