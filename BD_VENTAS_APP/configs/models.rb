require_relative 'database'

class Level < Sequel::Model(DB[:levels])
end

class User < Sequel::Model(DB[:users])
end

class Producto < Sequel::Model(DB[:productos])
end

class Category < Sequel::Model(DB[:categorys])
end

class Perfiles < Sequel::Model(DB[:perfiles])
end