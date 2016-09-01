class LiveAssetsController < ActionController::Base
  include ActionController::Live
  
  def hello
    while true
      response.stream.write "Hello World,I'm Ninja\n"
      sleep 1
    end
  rescue IOError
    response.stream.close
  end
end
