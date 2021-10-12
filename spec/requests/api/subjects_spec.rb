require 'swagger_helper'

describe 'Subjects Routes' do
  path '/api/v1/subjects' do
    get 'Retrieves a list of Subjects taught by the Teachers' do
      tags 'Subjects'
      produces 'application/json'

      response '200', 'Subjects found' do
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
