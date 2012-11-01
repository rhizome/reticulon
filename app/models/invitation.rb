class Invitation < ActiveRecord::Base

	has_one :user
  attr_accessible :email
  before_validation :generate_confirmation_token, :on => :create
  validates :email, :presence => true, :uniqueness => true
  validates :confirmation_token, :presence => true, :uniqueness => true

  protected

  def generate_confirmation_token
    begin
      token = SecureRandom.urlsafe_base64
    end while Invitation.where(:confirmation_token => token).exists?
    self.confirmation_token = token
  end

end
