import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  String usuario;
  String contrasenia;
  int perfil;

  Usuario.empty()
      : id = 0,
        usuario = '',
        contrasenia = '',
        perfil = 0;

  Usuario({
    required this.id,
    required this.usuario,
    required this.contrasenia,
    required this.perfil,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        perfil: json["perfil_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasenia": contrasenia,
        "perfil_id": perfil,
      };

  @override
  String toString() {
    return 'Usuario -> id: ${id}, usuario: ${this.usuario}, contrasenia: ${this.contrasenia}, perfil: ${this.perfil},';
  }
}
