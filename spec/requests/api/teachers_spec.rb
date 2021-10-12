require 'swagger_helper'

describe 'Teachers Routes' do
  path '/api/v1/teachers' do
    post 'Creates a new Teacher' do
      tags 'Teachers'
      consumes 'multipart/form-data'
      parameter name: :teacher, in: :formData, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          subject_id: { type: :integer },
          details: { type: :integer },
          professional_photo: { type: :file }
        },
        required: %w[name subject_id details professional_photo]
      }

      response '201', 'Teacher created' do
        let(:teacher) { Teacher.last }
        run_test!
      end

      response '422', 'invalid request' do
        let(:teacher) { { name: 'Foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/teachers' do
    get 'Retrieves a list of Teachers' do
      tags 'Teachers'
      produces 'application/json'

      response '200', 'Teachers found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 details: { type: :string },
                 professional_photo: { type: :string },
                 subject: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/teachers/{id}' do
    get 'Finds the Teacher with the {id} provided by the path' do
      tags 'Teachers'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Teachers found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 details: { type: :string },
                 professional_photo: { type: :string },
                 subject: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/teachers/{id}' do
    delete 'Deletes the Teacher with the {id} provided by the path' do
      tags 'Teachers'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '202', 'Deleted the Teacher' do
        let(:id) { Teacher.find(:id) }
        run_test!
      end

      response '404', 'Teacher not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
