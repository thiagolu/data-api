class CompanyRepository
  class << self
    def create(company_struct)
      Company.create({
        uuid: company_struct.id || SecureRandom.uuid,
        name: company_struct.name,
        zip: company_struct.zip || '',
        website: company_struct.website || '',
      })
    end
  end
end