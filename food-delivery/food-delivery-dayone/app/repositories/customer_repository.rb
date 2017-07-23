require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @customers = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

def all
  @customers
end

def add(customer)
  customer.id = @next_id
  @next_id += 1
  @customers << customer
  save
end

def find(id)
  @customers.find { |customer| customer.id == id }
end

def delete(id)
  customer = @customers.find { |customer| customer.id == id }
  index = @meals.index(customer)
  @customer.delete_at(index)
  save
end

private
def save
  CSV.open(@csv_file, 'wb') do |csv|
    csv << ['id', 'name', 'address']
    @customers.each do |customer|
      csv << [customer.id, customer.name, customer.address]
    end
  end
end

def load_csv
  csv_options = { headers: :first_row, header_converters: :symbol }
  CSV.foreach(@csv_file, csv_options) do |row|
  row[:id]    = row[:id].to_i
  @customers << Customer.new(row)
  @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end

end
