require 'sinatra'

get '/category/list' do
  perfil_id = params[:perfil_id]
  if perfil_id == nil then
    BodyPart.all.to_json
  else
    query = <<-STRING
        SELECT BP.id, BP.name FROM productos_perfiles EM 
        INNER JOIN productos E ON E.id = EM.producto_id 
        INNER JOIN categorys BP ON BP.id = E.categorys_id 
        WHERE perfil_id = #{perfil_id}
        GROUP BY BP.id;
      STRING
    DB[query].all.to_json
  end
end
