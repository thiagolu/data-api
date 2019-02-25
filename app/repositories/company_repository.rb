class CompanyRepository
  class << self

    def create_company(name, zip, website = '')
      uuid = SecureRandom.uuid

      Company.create({
        uuid: uuid,
        name: name,
        zip: zip,
        website: website,
      })
    end
  end
end