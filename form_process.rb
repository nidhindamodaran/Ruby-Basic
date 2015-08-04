require 'rubygems'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     'localhost',
  database: 'students',
  username: 'root',
  password: 'root'
)

ActiveRecord::Schema.define do
  create_table(:students,force:true, primary_key:'id')do |t|
     t.column :name, :string, limit:80
     t.column :age, :integer
     t.column :mob, :string, limit:20
     t.column :dept, :string, limit:80
     t.column :email, :string, limit:80

  end
end

class Student < ActiveRecord::Base
  attr_accessor :attr_list
  validates :name, :dept , presence:true
  validates :age, presence:true, numericality: { only_integer: true, message: "Enter correct Age "}, length: { maximum: 2, message: "Entered Age is Incorrect"}
  validates :mob, presence:true, uniqueness:true, numericality: { only_integer: true, message: "Enter correct Mobile Number "}, length: { is: 10, message: "Please check Mobile Number" }
  validates :email, presence:true, uniqueness:true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Enter correct Email"}
  def attr_list
    [:id, :name, :age, :mob, :dept, :email]
  end
end
