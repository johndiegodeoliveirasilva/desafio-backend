require "csv"
module Imports
  class Base
    def self.run(file, processed = false, file_id = nil)
      new(file, processed, file_id).run
    end

    def run
      process
    end

    private

    def read_file(record)
      hash_attributes = {}
      quote_chars = %w(" | ~ ^ & *)
      begin
        @report = CSV.parse(download_file(record), headers: :first_row, quote_char: quote_chars.shift).each_with_index do |row, index|
          row = row[0].delete('\\"').split(";")
          next if row[5].in?(["NA", nil])
          hash_attributes.merge!(index => params_commons(row) )
        end
      rescue CSV::MalformedCSVError
        quote_chars.empty? ? raise : retry 
      end
      hash_attributes
    end

    def download_file(record)
      record.avatar.download.force_encoding("UTF-8")
    end

    def params_commons(field)
      {
        supplier: supplier(field),
        expenditure: expenditure(field),
        deputy: deputy(field)
      }
    end

    def supplier(field)
      {
        txt_fornecedor: field[12],
        txt_cnpj_cpf: field[13]
      }
    end

    def expenditure(field)
      {
        txt_fornecedor: field[12],
        vlr_liquido: field[19],
        data_emissao: field[16],
        url_documento: field[30],
        descricao: field[9],
      }
    end

    def deputy(field)
      {
        tx_nome_parlamentar: field[0],
        sg_uf: field[5],
        id_cadastro: field[2],
        cpf: field[1],
        sg_partido: field[6]
      }
    end
  end
end
