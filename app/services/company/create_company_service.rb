class Company
  class CreateCompanyService
    def initialize(company_repository)
      @company_repository = company_repository
    end

    def perform(companies)
      ActiveRecord::Base.transaction do
        companies.each do |company|
          begin
            @company_repository.create(company)
          rescue ActiveRecord::RecordNotUnique
            next
          end
        end
      end
    end
  end
end