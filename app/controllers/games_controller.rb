class GamesController < ApplicationController
  def new
    @letters = []
    charset = ('A'..'Z').to_a
    10.times do
      @letters << charset.sample
    end
  end

  def score
    def call_api
      url = "https://dictionary.lewagon.com/#{@letters}"
      response = HTTParty.get(url)

      if response.success?
        data = response.parsed_body
        # Do something with the data
        render json: data
      else
        # Handle unsuccessful response
        render plain: "API call failed with status code: #{response.code}"
      end
    end

  end
end
