require 'acceptance_helper'

resource 'Cats' do
  header 'Content-Type', 'application/json'

  get '/api/v1/cats' do
    explanation 'Suggest the best deal for a customer'

    parameter :cat_type, 'Cat type', type: :string, with_example: true
    parameter :location, 'Customer location', type: :string, with_example: true

    example 'Getting a list of cats' do
      do_request(location: 'Kharkiv', cat_type: 'Devon Rex')

      aggregate_failures('testing response') do
        expect(status).to eq(200)
        expect(json).to eq({ 'name' => 'Devon Rex', 'price' => 100, 'location' => 'Kharkiv',
                             'image' => 'https://picsum.photos/200' })
      end
    end
  end
end
