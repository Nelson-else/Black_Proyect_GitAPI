class Estudiante < ApplicationRecord
    #validates :nombres, :apellido, :carrera, :carnet, :fecha_nacimeinto, :edad, :celular, presence: true


    validates :nombres, :apellidos, :carrera, :fecha_nacimiento, :edad, presence: true
    validates :celular, presence: true, numericality: { only_integer: true }
    validates :carnet, format: { with: /\A\d{2}-\d{5}-\d{1}\z/, message: "formato no valido"}

end
