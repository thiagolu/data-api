class CompanyRepository
  class << self
    def create(company_struct)
      uuid = SecureRandom.uuid

      Company.create({
        uuid: uuid,
        name: company_struct.name,
        zip: company_struct.zip,
        website: company_struct.website,
      })
    end
  end
end