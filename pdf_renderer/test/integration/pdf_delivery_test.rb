require "test_helper"

class PdfDeliverTest < ActionDispatch::IntegrationTest
  test "pdf request sends a pdf as file" do
    get home_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]

    assert_equal "attachment; filename=\"contents.pdf\"",
      headers["Content-Disposition"]
    #rails/actionpack/lib/action_dispatch/http/mime_types.rb <- the reason why rails know which content type to set in our response?
    ## http://www.ietf.org/rfc/rfc4627.txt
    # http://www.json.org/JSONRequest.html
    #Mime::Type.register "application/json", :json, %w( text/x-json application/jsonrequest )
    #Mime::Type.register "application/pdf", :pdf, [], %w(pdf)
    #Mime::Type.register "application/zip", :zip, [], %w(zip)

    assert_equal "application/pdf", headers["Content-Type"]
  end

  test "pdf request sends a pdf as file and use specific template" do
    get another_path(format: :pdf)

    assert_match "PDF", response.body
    assert_equal "binary", headers["Content-Transfer-Encoding"]

    assert_equal "attachment; filename=\"contents.pdf\"",
      headers["Content-Disposition"]
    #rails/actionpack/lib/action_dispatch/http/mime_types.rb <- the reason why rails know which content type to set in our response?
    ## http://www.ietf.org/rfc/rfc4627.txt
    # http://www.json.org/JSONRequest.html
    #Mime::Type.register "application/json", :json, %w( text/x-json application/jsonrequest )
    #Mime::Type.register "application/pdf", :pdf, [], %w(pdf)
    #Mime::Type.register "application/zip", :zip, [], %w(zip)

    assert_equal "application/pdf", headers["Content-Type"]
  end
end
