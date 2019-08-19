class Api::GooLab < Api::ApplicationRecord
  END_POINT = "https://labs.goo.ne.jp/api/hiragana"

  def self.to_ruby(sentence)
    uri = URI.parse(END_POINT)
    paramater = {"app_id" => ENV["GOO_LAB_APP_ID"], "sentence" => "#{sentence}", "output_type" => "hiragana"}
    response = http_post(uri, paramater)
    parsed_response = JSON.parse(response.body)

    case response
    when Net::HTTPSuccess
      logger.debug(parsed_response)
      return parsed_response["converted"]
    when Net::HTTPRedirection
      logger.debug(parsed_response)
      return nil
    else
      logger.debug(parsed_response)
      return nil
    end
  end

  def self.http_post(uri, paramater)
    response = nil
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
    request.body = paramater.to_json
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)
    return response
  end
end
