require 'swagger_helper'

RSpec.describe 'api/bookings', type: :request do
end


require 'swagger_helper'

describe 'Bookings Routes' do

  path 'api/v1/bookings' do

    post 'Books a Time with a Teacher' do
      tags 'Booking'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          teacher_id: { type: :integer },
          city_id: { type: :integer },
          booked_for: { type: :datetime }
        },
        required: [ 'username', 'teacher_id', 'city_id', 'booked_for' ]
      }

      response '201', 'booking created' do
        let(:booking) { {
          username: 'Foo',
          teacher_id: 1,
          city_id: 2,
          booked_for: '2021-10-11'
        } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:booking) { { username: 'Foo' } }
        run_test!
      end
    end
  end

  path '/blogs/{id}' do

    get 'Retrieves a blog' do
      tags 'Blogs', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Blog.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end