get '/perfil/resume' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  perfil_id = params[:perfil_id]
  # db access
  begin
    query = <<-STRING

        SELECT 
          (SELECT COUNT(*) FROM productos_perfiles WHERE perfil_id = #{perfil_id}) AS productos,
          (SELECT COUNT(categorys_id) FROM (
              SELECT E.categorys_id
              FROM productos_perfiles EM
              INNER JOIN productos E ON EM.producto_id = E.id
              WHERE perfil_id = #{perfil_id}
              GROUP BY E.categorys_id
          ) AS categorys_subquery) AS categorys_count;

    STRING
    record = DB[query].first
    if record then
      resp[:message] = 'Lista de ejercicios'
      resp[:data] = {
        productos: record[:productos], # int
        categorys: record[:categorys_count], # int
      }
    else
      resp[:message] = 'Usuario aún no cuenta con ejercicios asignados'
    end
    status = 200
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error no esperado'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end

get '/perfil/producto' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  perfil_id = params[:perfil_id]
  producto_id = params[:producto_id]
  # db access
  begin
    query = <<-STRING
      SELECT E.id, E.name, EM.sets, EM.reps, E.description FROM productos_perfiles EM 
      INNER JOIN productos E ON EM.producto_id = E.id
      WHERE perfil_id = #{perfil_id} AND producto_id = #{producto_id};
    STRING
    record = DB[query].first
    if record then
      resp[:message] = 'Resultado de los relojes'
      resp[:data] = {
        id: record[:id], 
        name: record[:name], 
        description: record[:description], 
        sets: record[:sets], 
        reps: record[:reps], 
      }
    else
      resp[:message] = 'Usuario aún no tiene asignado ese ejercicio'
    end
    status = 200
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error no esperado'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end

get '/perfil/productos' do
  # params
  status = 500
  resp = {
    :message => '',
    :data => '',
  }
  perfil_id = params[:perfil_id]
  categorys_id = params[:categorys_id]
  # db access
  begin
    query = <<-STRING
      SELECT E.id, E.name, E.image_url, E.description, E.categorys_id, EM.sets, EM.reps FROM productos_perfiles EM 
      INNER JOIN productos E ON E.id = EM.producto_id 
      INNER JOIN categorys BP ON BP.id = E.categorys_id
      WHERE perfil_id = #{perfil_id};
    STRING
    if categorys_id != nil then
      query = query + ` AND categorys_id = #{categorys_id};`
    end
    rs = DB[query]
    # puts query
    if rs then
      resp[:data] = []
      rs.each do |row|
        # Procesar cada fila del resultado y agregarla a resp[:data]
        resp[:data] << {
          id: row[:id],
          name: row[:name],
          image_url: row[:image_url],
          description: row[:description],
          categorys_id: row[:categorys_id],
          sets: row[:sets],
          reps: row[:reps],
        }
      end
    else
      resp[:message] = 'Usuario aún no tiene asignado ese ejercicio'
    end
    status = 200
  rescue Sequel::DatabaseError => e
    resp[:message] = 'Error al acceder a la base de datos'
    resp[:data] = e.message
  rescue StandardError => e
    resp[:message] = 'Error no esperado'
    resp[:data] = e.message
  end
  # response
  status status
  resp.to_json
end
