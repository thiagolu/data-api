require 'rails_helper'

RSpec.describe Serializers::CompanySerializer do
  let(:base_name_string) { 'my base string' }
  let(:name_string) { "#{base_name_string}" }

  let(:base_id_string) { '123llaa' }
  let(:id_string) { "#{base_id_string}" }

  let(:base_zip_string) { '12345' }
  let(:zip_string) { "#{base_zip_string}" }

  let(:base_website_string) { 'http://pudim.com.br/' }
  let(:website_string) { "#{base_website_string}" }

  let(:company) { CompanyStruct.new(name: name_string, id: id_string, zip: zip_string, website: website_string) }
  
  describe "#tread_data" do
    let(:action) { described_class.treat_data(company) }
    it "returns company struct" do
      expect(action.class).to eq(CompanyStruct) 
    end

    context "with invalid characters" do
      let(:name_string) { "       #{base_name_string}        " }
      let(:base_zip_string) { "12.3-45" }
      let(:website_string) { "#{base_website_string}123" }

      it "removes extra white spaces" do
        expect(described_class.treat_data(company).name).to eq(base_name_string)
      end

      it "returns only numerical chars for zip" do
        expect(described_class.treat_data(company).zip).to eq('12345')
      end

      it "validates website" do
        expect(described_class.treat_data(company).website).to eq('http://pudim.com.br/123')
      end
    end
  end
  
end
