module Api
  module V1
    class CountriesController < ApiController
      skip_before_action :verify_authenticity_token

      def index
        alpha2 = params[:alpha2] || false
        alpha3 = params[:alpha3] || false

        countries = Country.where(active: true)
        countries = countries.where(alpha2: alpha2) if alpha2
        countries = countries.where(alpha3: alpha3) if alpha3
        @countries = countries.all

      rescue StandardError => e
        render json: { error: true, msg: "Invalid Input: #{e.message}" }
      end

      def delete
        begin
          alpha2 = params[:alpha2] || false
          raise 'No Alpha2 provided' unless alpha2

          countries = Country.where(active: true)
          country = countries.where(alpha2: alpha2).first if alpha2
          raise "Country with alpha2 `#{alpha2}` not found." unless country

          country.update(active: false)
          json_msg = "Country with alpha2 `#{alpha2}` has been removed."

          render json: { error: false, msg: json_msg }
        rescue StandardError => e
          render json: { error: true, msg: "Error occured: #{e.message}" }
        end
      end

      def update
        begin
          alpha2 = params[:alpha2] || false
          raise 'No Alpha2 provided' unless alpha2

          countries = Country.where(active: false)
          country = countries.where(alpha2: alpha2).first if alpha2
          raise "Deleted Country with alpha2 `#{alpha2}` not found." unless alpha2 && country

          country.update(active: true)
          json_msg = "Country with alpha2 `#{alpha2}` has been un-deleted."

          render json: { error: false, msg: json_msg }
        rescue StandardError => e
          render json: { error: true, msg: "Error occured: #{e.message}" }
        end
      end
    end
  end
end