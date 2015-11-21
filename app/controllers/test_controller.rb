class TestController < ApplicationController
  # GET test/move.json
  def move
    render json: { instruction_ids: [ 1, 2, 3, 1, 1, 1] }
  end
end
