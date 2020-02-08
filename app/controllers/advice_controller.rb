class AdviceController < ApplicationController

  def show
    redirect_to root_path unless logged_in?
  end

  def create
    @advice = generate_advice
  end

  private
    def service
       AdviceService.new
    end

    def generate_advice
      advice_data = service.advice_info
      Advice.new(advice_data)
    end
end
