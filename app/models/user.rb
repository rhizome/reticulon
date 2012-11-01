class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.merge_validates_length_of_email_field_options({:unless => :unconfirmed?})	
	  c.merge_validates_format_of_email_field_options({:unless => :unconfirmed?})
	  c.merge_validates_uniqueness_of_email_field_options({:unless => :unconfirmed?})
	  c.require_password_confirmation = false
	  c.merge_validates_length_of_password_field_options({:unless => :unconfirmed?, :minimum => 3})
	  c.merge_validates_length_of_login_field_options({:within => 2..40, :unless => :unconfirmed?})
	  c.merge_validates_format_of_login_field_options({:unless => :unconfirmed?})
	  c.merge_validates_uniqueness_of_login_field_options({:unless => :unconfirmed?})
  end
  validates :email, :presence => true
  attr_accessible :email, :confirmed

  protected

  def unconfirmed?
  	!self.confirmed
  end
end
