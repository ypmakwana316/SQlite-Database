class UserTable{
  int? id;
  String title;
  String description;


  UserTable({this.id,required this.title,required this.description});

  factory UserTable.fromJson(Map<String,dynamic> json)=> UserTable(id: json['id'], title:json['title'],description:json['description'] );

  Map<String , dynamic> toJson() =>{
    'id' : id,
    'title' : title,
    'description' : description,

  };
}