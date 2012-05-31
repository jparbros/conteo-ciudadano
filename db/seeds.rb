# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def lowercase_accents(string)
  string.gsub('Á','á').gsub('É','é').gsub('Í','í').gsub('Ó','ó').gsub('Ú','ú') if string
end

#Admin.create(email: 'admin@admin.com', password: 'Passw0rd', password_confirmation: 'Passw0rd')

puts "Leyendo archivo"
casillas = File.read('doc/casillas_2012.csv').force_encoding('MacRoman').encode('UTF-8')

puts "Parseando archivo"
casillas_array = CSV.parse(casillas, :headers => true)

casillas_array.each do |casilla|
  estado = State.find_or_create_by_name(casilla['NOMBRE_ESTADO'].humanize)

  puts "Creando casilla #{casilla['CABECERA_DISTRITAL']} #{casilla['SECCION']} #{casilla['TIPO_CASILLA_W']} \n"

  casilla = Box.create( address: lowercase_accents(casilla['DOMICILIO'].try(:humanize)),
    district: casilla['ID_DISTRITO'],
    district_head: lowercase_accents(casilla['CABECERA_DISTRITAL'].try(:humanize)),
    location: lowercase_accents(casilla['UBICACION_CASILLA'].try(:humanize)),
    nominal_list: casilla['LISTA_NOMINAL_CASILLA'],
    references: lowercase_accents(casilla['REFERENCIA_CASILLA'].try(:humanize)),
    section: casilla['SECCION'],
    state_id: estado.id,
    kind: lowercase_accents(casilla['TIPO_CASILLA_W'].try(:humanize)),
    number: casilla['ID_CASILLA']
  )

  casilla.create_result
end