require 'rails_helper'

RSpec.describe Company::CsvParser do
  let(:file) { File.new('spec/data_templates/company_input.csv') }

  describe "#parse_file_data_to_struct" do
    context "small data list" do
      it "returns company struct array" do
        expect(described_class.parse_file_data_to_struct(file).size).to eq(2)
      end
    end
  end
  
end