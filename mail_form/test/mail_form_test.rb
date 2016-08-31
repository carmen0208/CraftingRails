require 'test_helper'
require 'fixtures/sample_mail'

class MailFormTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, MailForm
  end
  test "sample mail has name nad email as attributes" do
    sample = SampleMail.new
    sample.name = "Carmen"
    assert_equal "Carmen", sample.name
    sample.email = "carmen.liu@activenetwork.com"
    assert_equal "carmen.liu@activenetwork.com", sample.email

    sample.clear_name
    sample.clear_email
    assert_nil sample.name
    assert_nil sample.email
  end
end
