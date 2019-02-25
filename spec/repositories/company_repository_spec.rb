require 'rails_helper'

RSpec.describe CompanyRepository do
  describe "#create_company" do
    context "valid args" do
      it "change by one" do
        expect{ CompanyRepository.create(OpenStruct.new(name: 'My comp', zip: '01099')) }.to change{ Company.count }.by(1)
      end
    end
  end
end