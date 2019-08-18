class Api::V1::Main::HomeController < ApplicationController
  def get_test_text(inputText)
    result = {
      testText: inputText
    }

    return result
  end
end
