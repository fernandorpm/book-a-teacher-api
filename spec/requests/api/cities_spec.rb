require 'swagger_helper'

describe 'Cities Routes' do
  path '/api/v1/cities' do
    get 'Retrieves a list of Cities' do
      tags 'Cities'
      produces 'application/json'

      response '200', 'Cities found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 created_at: { type: :string, format: :datetime },
                 updated_at: { type: :string, format: :datetime }
               }
        run_test!
      end
    end
  end
end
