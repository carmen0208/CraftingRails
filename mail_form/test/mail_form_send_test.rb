require 'test_helper'
require 'fixtures/sample_mail'

class MailFormSendTest < ActiveSupport::TestCase

  setup do 
    ActionMailer::Base.deliveries.clear
  end
  test "delivers an email with attributes" do
    sample = SampleMail.new
    # Simulate data from the form
    sample.email = "user@example.com"
    sample.deliver

    assert_equal 1, ActionMailer::Base.deliveries.size
    mail = ActionMailer::Base.deliveries.last

    assert_equal ["user@example.com"], mail.from
    assert_match "Email: user@example.com", mail.body.encoded
    
  end
  
end
