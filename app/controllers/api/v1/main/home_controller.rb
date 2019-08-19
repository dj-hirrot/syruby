class Api::V1::Main::HomeController < Api::V1::ApplicationController
  def get_test_text
    response = Api::GooLab.to_ruby(home_params[:inputText])

    result = {
      testText: response
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
