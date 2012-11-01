require 'test_helper'

class InvitationTest < ActiveSupport::TestCase

  test "Invitation created" do
    assert Invitation.create(email: Faker::Internet.email)
  end

  test "can't dupe emails" do
  	# flunk
  	email = Faker::Internet.email
  	assert_difference "Invitation.count" do
  		assert Invitation.create(:email => email)
  	end
  	assert_no_difference "Invitation.count" do
  		Invitation.create(email: email)
  	end
  end
end
