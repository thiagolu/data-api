class Company
  class AggregateCompanyDataService
    def initialize(company_repository)
      @company_repository = company_repository
    end

    def perform(new_companies_data)
      companies = @company_repository.search(new_companies_data)

      new_companies_data.each do |company|
        @company_repository.update(company, :website, company.website) if company.website
      end
    end
  end
end