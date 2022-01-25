module Api
  module V1
    class CatsController < ::Api::V1::BaseController
      def index
        best_deal =
          {
            name: 'Devon Rex',
            price: 100,
            location: 'Kharkiv',
            image: 'https://picsum.photos/200'
          }
        render json: best_deal
      end
    end
  end
end
