module Serializers
  class CompanySerializer
    class << self
      def treat_data(company)
        company.name = remove_white_spaces(company.name)
        company.zip = remove_non_numerical(company.zip)
        company.website = validate_uri(company.website)

        company
      end

      def remove_white_spaces(string)
        return unless string

        string.strip
      end

      def remove_non_numerical(string)
        return unless string

        string.gsub(/\D/, '')
      end

      def validate_uri(url)
        return unless url

        mount_website(url)
      end

      def mount_website(url)
        begin
          uri = URI.parse(url)
        rescue URI::InvalidURIError
          uri = URI.parse(URI.decode(url))
        end

        return uri.to_s if URI::HTTP
        url || ''
      end
    end
  end
end