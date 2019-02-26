class CompanyRepository
  class << self
    def create(company_struct)
      uuid = SecureRandom.uuid

      Company.create({
        uuid: company_struct.id || uuid,
        name: company_struct.name,
        zip: company_struct.zip,
        website: company_struct.website,
      })
    end
  end
end