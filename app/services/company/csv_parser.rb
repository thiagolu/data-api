require 'csv'

class Company
  class CsvParser
    INDEXES = {
      id_index: 0,
      name_index: 1,
      zip_index: 2,
    }

    def self.parse_file_data_to_struct(file)
      csv_data = CSV.parse(file.read)
      indexes = nil

      csv_data.map.with_index do |row, index|

        indexes ||= {
          id_index: row.find_index('id'),
          name_index: row.find_index('company_name'),
          zip_index: row.find_index('zip'),
          website: row.find_index('website')
        }

        next if index == 0
        next if row.empty?

        CompanyStruct.new(
          id: indexes[:id_index] ? row[indexes[:id_index]] : '',
          name: indexes[:name_index] ? row[indexes[:name_index]] : '',
          zip: indexes[:zip_index] ? row[indexes[:zip_index]] : '',
          website: indexes[:website] ? row[indexes[:website]] : '',
        )
      end.compact
    end
  end
end