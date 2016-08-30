module PdfRenderer
end

require "prawn"
#rails/actionpack/lib/action_controller/metal/renderers.rb--> add :json do |json, options| end
ActionController::Renderers.add :pdf do |filename, options|
  pdf = Prawn::Document.new
  #render_to_stringrender_to_string(*args, &block)
  #Raw rendering of a template to a string.
  pdf.text render_to_string(options)
  #send_date: Sends the given binary data to the browser. This method is similar to render plain: data,
  #but also allows you to specify whether the browser should display the response as a file 
  #attachment (i.e. in a download dialog) or as inline data. You may also set the content type, 
  #the apparent file name, and other things.
  send_data(pdf.render, filename: "#{filename}.pdf",
           disposition:"attachment")
end
