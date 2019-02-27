class Company
  class CreateCompanyService
    def initialize(company_repository)
      @company_repository = company_repository
    end

    def perform(companies)
      ids = companies.pluck(:id)
      existing_companies = Company.where(id: ids)
      new_companies = companies.reject { |company| !ids.include?(company.id) }

      ActiveRecord::Base.transaction do
        new_companies.each do |company|
          @company_repository.create(company)
        end
      end
    end
  end
end