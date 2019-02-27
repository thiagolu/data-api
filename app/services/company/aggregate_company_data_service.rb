class Company
  class AggregateCompanyDataService
    def initialize(company_repository)
      @company_repository = company_repository
    end

    def perform(new_companies_data)
      @company_repository.search(new_companies_data)
      puts new_companies_data
    end
  end
end