require 'sinatra'

# Ruta para obtener la lista de perfiles
get '/Perfiles/list' do
  code = params['code']

  if code.nil?  # Si no se especifica 'code', listar todos los perfiles
    resp = Perfiles.all.to_json
  else  # Si se especifica 'code', filtrar por ese código
    resp = Perfiles.where(code: code).all.to_json
  end

  resp
end
