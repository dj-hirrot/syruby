class Api::V1::Main::HomeController < Api::V1::ApplicationController
  def get_test_text
    p "000000000000000000000000000000000000000"
    p params.inspect
    p home_params.inspect
    p home_params[:inputText]
    p "000000000000000000000000000000000000000"
    result = {
      testText: home_params[:inputText]
    }

    render json: result
  end

  private
    def home_params
      params.require(:home).permit(home_param_items)
    end

    def home_param_items
      %i[inputText]
    end
end
