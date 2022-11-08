class Model{
int id;
String poster_path;
String title;
double vote_average;
String overview;

Model(
      {
        required this.id,
        required this.poster_path,
        required this.title,
        required this.vote_average,
        required this.overview});

factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json["id"],
      poster_path: json["poster_path"],
      title: json["title"],
      vote_average:json["vote_average"],
      overview: json["overview"],
    );
  }
//

//

}