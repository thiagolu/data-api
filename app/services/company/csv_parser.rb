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
      csv_data.map.with_index do |row, index|

        next if index == 0
        next if row.empty?

        CompanyStruct.new(
          id: row[INDEXES[:id_index]],
          name: row[INDEXES[:name_index]],
          zip: row[INDEXES[:zip_index]]
        )
      end.compact
    end
  end
end