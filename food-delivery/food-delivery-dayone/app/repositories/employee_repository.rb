require_relative '../models/employee'
require 'csv'

class EmployeeRepository
  attr_accessor :employees

  def initialize(csv_file)
    @employees = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @employees
  end

  def all_delivery
    @employees.select { |employee| employee.delivery_guy? }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username}
  end

  def find(id)
    employee = @employees.find { |employee| employee.id == id }
  end
  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
    row[:id]    = row[:id].to_i
    @employees << Employee.new(row)
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
    end
  end
end
