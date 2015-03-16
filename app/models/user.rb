class User
  include Mongoid::Document
  include Mongoid::Timestamps
  def as_json(options={})
    attrs = super(options)
    attrs["id"] = attrs["_id"]
    attrs
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username_validations, presence: true

  field :email, type: String, default: ""
  field :username, type: String, default: ""

  field :encrypted_password, type: String, default: ""
  field :current_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,       type: Integer, default: 0
  field :current_sign_in_at,  type: Time
  field :last_sign_in_at,     type: Time
  field :current_sign_in_ip,  type: String
  field :last_sign_in_ip,     type: String

  def username_validations
    errors.add(:username, 'can\'t be empty') if username.blank?
    errors.add(:username, 'can\'t contain less than 3 symbols') if username.size < 3
    username = self.username.split
    errors.add(:username, 'can\'t contain more than 2 words') if username.size > 2
    if username.size == 2
      errors.add(:username, '1 part can\'t contain more than 12 symbols') if username[0].size > 12
      errors.add(:username, '2 part can\'t contain more than 12 symbols') if username[1].size > 12
    elsif username.size == 1
      errors.add(:username, 'can\'t contain more than 12 symbols') if username[0].size > 12
    end
  end
end
