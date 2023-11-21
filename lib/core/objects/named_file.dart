import 'dart:convert';

class NamedFile {
  final String name;
  final String path;

  NamedFile({
    required this.name,
    required this.path,
  });

  NamedFile copyWith({
    String? name,
    String? path,
  }) {
    return NamedFile(
      name: name ?? this.name,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'path': path,
    };
  }

  factory NamedFile.fromMap(Map<String, dynamic> map) {
    return NamedFile(
      name: map['name'] as String,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NamedFile.fromJson(String source) => NamedFile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NamedFile(name: $name, path: $path)';

  @override
  bool operator ==(covariant NamedFile other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.path == path;
  }

  @override
  int get hashCode => name.hashCode ^ path.hashCode;
}
