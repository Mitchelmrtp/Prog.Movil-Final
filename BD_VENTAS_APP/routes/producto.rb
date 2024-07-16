require 'sinatra'

get '/producto/list' do
  categorys_id = params['categorys_id']
  perfil_id = params['perfil_id']
  if perfil_id == nil then # listado de ejercicios
    if categorys_id == nil then
      resp = Producto.all.to_json
    else
      resp = Producto.where(categorys_id: categorys_id).all.to_json
    end
  else # listado de ejercicios del miembro
    if perfil_id != nil then
      query = <<-STRING
        SELECT E.id, E.name, E.image_url, E.precio, E.description, E.categorys_id 
        FROM productos_perfiles EM 
        INNER JOIN productos E ON E.id = EM.producto_id 
        INNER JOIN categorys BP ON BP.id = E.categorys_id
        WHERE EM.perfil_id = #{perfil_id};
      STRING
      resp = DB[query].all.to_json
    else
      query = <<-STRING
        SELECT E.id, E.name, E.image_url, E.precio, E.description, E.categorys_id 
        FROM productos_perfiles EM 
        INNER JOIN productos E ON E.id = EM.producto_id 
        INNER JOIN categorys BP ON BP.id = E.categorys_id
        WHERE EM.perfil_id = #{perfil_id} AND E.categorys_id = #{categorys_id};
      STRING
      resp = DB[query].all.to_json
    end
  end
  resp
end
