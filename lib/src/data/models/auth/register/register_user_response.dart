class RegisterUserResponse {
  RegisterUserResponse({
    this.status,
    this.description,
    this.data,
  });

  RegisterUserResponse.fromJson(json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  String? description;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.userFound,
    this.clientPlatform,
    this.clientType,
    this.userId,
    this.role,
    this.token,
    this.permissions,
    this.loginTableSlug,
    this.user,
  });

  Data.fromJson(json) {
    userFound = json['user_found'];
    clientPlatform = json['client_platform'];
    clientType = json['client_type'] != null ? ClientType.fromJson(json['client_type']) : null;
    userId = json['user_id'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(Permissions.fromJson(v));
      });
    }
    loginTableSlug = json['login_table_slug'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  bool? userFound;
  dynamic clientPlatform;
  ClientType? clientType;
  String? userId;
  Role? role;
  Token? token;
  List<Permissions>? permissions;
  String? loginTableSlug;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_found'] = userFound;
    map['client_platform'] = clientPlatform;
    if (clientType != null) {
      map['client_type'] = clientType?.toJson();
    }
    map['user_id'] = userId;
    if (role != null) {
      map['role'] = role?.toJson();
    }
    if (token != null) {
      map['token'] = token?.toJson();
    }
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    map['login_table_slug'] = loginTableSlug;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.password,
    this.phone,
    this.companyId,
    this.language,
    this.timezone,
  });

  User.fromJson(json) {
    id = json['id'];
    password = json['password'];
    phone = json['phone'];
    companyId = json['company_id'];
    language = json['language'];
    timezone = json['timezone'];
  }

  String? id;
  String? password;
  String? phone;
  String? companyId;
  dynamic language;
  dynamic timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['password'] = password;
    map['phone'] = phone;
    map['company_id'] = companyId;
    map['language'] = language;
    map['timezone'] = timezone;
    return map;
  }
}

class Permissions {
  Permissions({
    this.id,
    this.roleId,
    this.tableSlug,
    this.read,
    this.write,
    this.update,
    this.delete,
    this.automation,
    this.languageBtn,
    this.settings,
    this.shareModal,
    this.viewCreate,
  });

  Permissions.fromJson(json) {
    id = json['id'];
    roleId = json['role_id'];
    tableSlug = json['table_slug'];
    read = json['read'];
    write = json['write'];
    update = json['update'];
    delete = json['delete'];
    automation = json['automation'];
    languageBtn = json['language_btn'];
    settings = json['settings'];
    shareModal = json['share_modal'];
    viewCreate = json['view_create'];
  }

  String? id;
  String? roleId;
  String? tableSlug;
  String? read;
  String? write;
  String? update;
  String? delete;
  String? automation;
  String? languageBtn;
  String? settings;
  String? shareModal;
  String? viewCreate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['role_id'] = roleId;
    map['table_slug'] = tableSlug;
    map['read'] = read;
    map['write'] = write;
    map['update'] = update;
    map['delete'] = delete;
    map['automation'] = automation;
    map['language_btn'] = languageBtn;
    map['settings'] = settings;
    map['share_modal'] = shareModal;
    map['view_create'] = viewCreate;
    return map;
  }
}

class Token {
  Token({
    this.accessToken,
    this.refreshToken,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.refreshInSeconds,
  });

  Token.fromJson(json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    refreshInSeconds = json['refresh_in_seconds'];
  }

  String? accessToken;
  String? refreshToken;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;
  num? refreshInSeconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['expires_at'] = expiresAt;
    map['refresh_in_seconds'] = refreshInSeconds;
    return map;
  }
}

class Role {
  Role({
    this.id,
    this.clientTypeId,
    this.name,
    this.projectId,
  });

  Role.fromJson(json) {
    id = json['id'];
    clientTypeId = json['client_type_id'];
    name = json['name'];
    projectId = json['project_id'];
  }

  String? id;
  String? clientTypeId;
  String? name;
  String? projectId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_type_id'] = clientTypeId;
    map['name'] = name;
    map['project_id'] = projectId;
    return map;
  }
}

class ClientType {
  ClientType({
    this.id,
    this.name,
    this.selfRegister,
  });

  ClientType.fromJson(json) {
    id = json['id'];
    name = json['name'];
    selfRegister = json['self_register'];
  }

  String? id;
  String? name;
  bool? selfRegister;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['self_register'] = selfRegister;
    return map;
  }
}
