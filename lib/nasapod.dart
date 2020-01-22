class NasaPOD {
  String apodSite;
  String copyright;
  String date;
  String description;
  String hdurl;
  String mediaType;
  String title;
  String url;

  NasaPOD(
      {this.apodSite,
      this.copyright,
      this.date,
      this.description,
      this.hdurl,
      this.mediaType,
      this.title,
      this.url});

  NasaPOD.fromJson(Map<String, dynamic> json) {
    apodSite = json['apod_site'];
    copyright = json['copyright'];
    date = json['date'];
    description = json['description'];
    hdurl = json['hdurl'];
    mediaType = json['media_type'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apod_site'] = this.apodSite;
    data['copyright'] = this.copyright;
    data['date'] = this.date;
    data['description'] = this.description;
    data['hdurl'] = this.hdurl;
    data['media_type'] = this.mediaType;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
