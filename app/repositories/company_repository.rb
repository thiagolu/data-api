class CompanyRepository
  class << self
    def create(company_struct)
      Company.create({
        uuid: company_struct.id || SecureRandom.uuid,
        name: company_struct.name,
        zip: company_struct.zip || '',
        website: company_struct.website || '',
      })
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::StatementInvalid
      false
    end

    def search(companies_data)
      names = companies_data.pluck(:name)
      zips = companies_data.pluck(:zip)

      Company.where(name: names).or(Company.where(zip: zips))
    end

    def update(company, col, value)
      search([company]).update("#{col.to_s}": value)
    end
    
  end
end