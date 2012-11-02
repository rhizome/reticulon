require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_select "div" do
	    assert_select "h1", 1
	    assert_select "h2", 1
	  end
    assert_select "form", 1 do
    	assert_select "label", "Email"
    	assert_select "input[type=text]"
    	assert_select "input[type=submit]"
    end
  end

  test "can create invitation" do
    # Started POST "/invitations" for 127.0.0.1 at 2012-10-26 18:00:09 -0700
    # Processing by InvitationsController#create as HTML
    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"zpj1NBuT+31wLw+Z4jHUNq9RfpTTmrGwzem6GfsbtfQ=", "invitation"=>{"email"=>"glerp@brok.co"}, "commit"=>"Notify Me"}
    invitation_email = Faker::Internet.email
    get :index
    assert_response :success
    assert_difference 'ActionMailer::Base.deliveries.size', +1, ActionMailer::Base.deliveries.inspect do
      post :create, :invitation => { :email => invitation_email }
      assert_response :redirect
    end
    invite_email = ActionMailer::Base.deliveries.last
    puts invite_email
    assert_equal 'notifications@CHANGEME.invalid', invite_email['from'].to_s
    assert_equal invitation_email, invite_email['to'].to_s
  end


  test "confirming invite should create user" do
    invite = FactoryGirl.create(:invitation, :email => Faker::Internet.email)
    post :create, :email => invite.email
    assert_response :redirect
    assert_difference "User.count", +1 do
      get :show, :id => invite.confirmation_token
      assert_response :redirect
    end
  end

  test "repeat visit to confirmation url should simply redirect" do
    invite = FactoryGirl.create(:invitation, :email => Faker::Internet.email)
    assert_difference "User.count", +1 do
      get :show, :id => invite.confirmation_token
      assert_response :redirect
    end
    get :show, :id => invite.confirmation_token
    assert_redirected_to root_url
  end
end
