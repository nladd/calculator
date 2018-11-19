require 'csv'

class Funds

  @@funds = {}
  cattr_accessor :funds

  SHARE_CLASS_A = 'A'
  SHARE_CLASS_C = 'C'
  SHARE_CLASS_I = 'I'
  SHARE_CLASS_R6 = 'R6'
  SHARE_CLASSES = [SHARE_CLASS_A, SHARE_CLASS_C, SHARE_CLASS_I, SHARE_CLASS_R6]

  class << self

    def all_funds
      load_funds #if @@funds.empty?
      funds
    end

    def load_funds

      CSV.foreach(fund_file, headers: true) do |row|
        name = row['Name']&.rstrip
        SHARE_CLASSES.each do |share_class|
          if name&.match?(/#{share_class}\Z/)
            common_name = name.gsub(/#{share_class}\Z/, '').rstrip
            fund_data = {share_class => {exp_ratio: row['Prospectus Net Expense Ratio'].to_f / 100.0}}
            funds.keys.include?(common_name) ? funds[common_name].merge!(fund_data) : funds[common_name] = fund_data
          end
        end

      end # close CSV

    end


    def fund_file
      Rails.root.join('db', 'data', 'funds.csv')
    end

  end
end
