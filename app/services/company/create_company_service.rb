class Company
  class CreateCompanyService
    def initialize(company_repository)
      @company_repository = company_repository
    end

    def perform(companies)
      companies.each do |company|
        @company_repository.create(company)
      end
    end
  end
end