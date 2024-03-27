class Posts {
  final String numRows;
  final int numPages;
  final int page;
  final String limit;
  final List<Post> posts;

  Posts({
    required this.numRows,
    required this.numPages,
    required this.page,
    required this.limit,
    required this.posts,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      numRows: json['numRows'],
      numPages: json['numPages'],
      page: json['page'],
      limit: json['limit'],
      posts: List<Post>.from(json['posts'].map((post) => Post.fromJson(post))),
    );
  }
}

class Post {
  final int id;
  final String name;
  final String email;
  final String password;
  final String imagepath;
  final String? signaturepath;
  final String phonenumber;
  final int superadmin;
  final Role role;
  final String displayname;
  final String address;
  final String headsubline;
  final String slogan;
  final String weburl;
  final int status;
  final String created;
  final String modified;
  final int roleid;
  final String rolename;
  final UserId user;

  Post({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.imagepath,
    required this.signaturepath,
    required this.phonenumber,
    required this.superadmin,
    required this.role,
    required this.displayname,
    required this.address,
    required this.headsubline,
    required this.slogan,
    required this.weburl,
    required this.status,
    required this.created,
    required this.modified,
    required this.roleid,
    required this.rolename,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      imagepath: json['imagepath'],
      signaturepath: json['signaturepath'],
      phonenumber: json['phonenumber'],
      superadmin: json['superadmin'],
      role: Role.fromJson(json['role_id']),
      displayname: json['displayname'],
      address: json['address'],
      headsubline: json['headsubline'] ?? '',
      slogan: json['slogan'] ?? '',
      weburl: json['weburl'] ?? '',
      status: json['status'] ?? '',
      created: json['created'] ?? '',
      modified: json['modified'] ?? '',
      roleid: json['roleid'] ?? '',
      rolename: json['rolename'] ?? '',
      user: UserId.fromJson(json['user_id']),
    );
  }
}

class Role {
  final int value;
  final String label;

  Role({
    required this.value,
    required this.label,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      value: json['value'],
      label: json['label'],
    );
  }
}

class UserId {
  final int value;
  final String label;

  UserId({
    required this.value,
    required this.label,
  });

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      value: json['value'],
      label: json['label'],
    );
  }
}