require 'rails_helper'

RSpec.describe Company::CreateCompanyService do
  let(:repository_mock) { double('CompanyRepository') }
  let(:companies) do
    [
      CompanyStruct.new(name: 'aa', zip: '12312'),
      CompanyStruct.new(name: 'bb', zip: '12311')
    ]
  end
  let(:create_service) { Company::CreateCompanyService.new(repository_mock) }

  describe "perform" do
    it "creates companies from list" do
      expect(repository_mock).to receive(:create).twice
      create_service.perform(companies)
    end
  end
end