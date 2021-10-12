require 'swagger_helper'

describe 'Bookings Routes' do
  path '/api/v1/bookings' do
    post 'Books a Time with a Teacher' do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          teacher_id: { type: :integer },
          city_id: { type: :integer },
          booked_for: { type: :string, format: :date }
        },
        required: %w[username teacher_id city_id booked_for]
      }

      response '201', 'booking created' do
        Booking.create(
          username: 'Foo',
          teacher_id: 1,
          city_id: 2,
          booked_for: '2021-10-11'
        )
        run_test!
      end

      response '422', 'invalid request' do
        let(:booking) { { username: 'Foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/bookings' do
    get 'Retrieves a list of bookings' do
      tags 'Bookings'
      produces 'application/json'

      response '200', 'Scheduled Bookings' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 username: { type: :string },
                 teacher: { type: :string },
                 subject: { type: :string },
                 city: { type: :string },
                 booked_for: { type: :string, format: :date }
               }
        run_test!
      end
    end
  end

  path '/api/v1/bookings/{id}' do
    delete 'Deletes the Booking with the {id} provided by the path' do
      tags 'Bookings'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '202', 'Deleted the booking scheduled' do
        let(:id) { Booking.find(:id) }
        run_test!
      end

      response '404', 'Booking not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
