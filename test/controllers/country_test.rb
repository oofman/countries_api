require 'test_helper'
module Api
  module V1
    class CountriesControllerTest < ActionController::TestCase
      # testing first/only entry
      def test_index
        get :index, params: { alpha2: 'za' }, **{ format: 'json' }

        assert_response 200
        assert_equal(countries.first.name, 'South Africa', 'Not working.')
      end

      # testing last entry (multiple results)
      def test_index
        get :index, **{ format: 'json' }

        assert_response 200
        assert_equal(countries.last.name, 'Botswana', 'Not working.')
      end

      # testing soft deleting South Afica
      def test_delete
        delete :delete, params: { alpha2: 'za' }, **{ format: 'json' }

        assert_response 200
        assert_equal(countries.first.name, 'South Africa', 'Not working.')
        assert_equal(countries.first.active, false, 'Not working.')
      end

      # testing soft un-deleting South Afica
      def test_undelete
        put :update, params: { alpha2: 'za' }, **{ format: 'json' }

        assert_response 200
        assert_equal(countries.first.name, 'South Africa', 'Not working.')
        assert_equal(countries.first.active, true, 'Not working.')
      end

    end
  end
end
