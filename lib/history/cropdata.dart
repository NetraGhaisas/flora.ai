class CropData {
  String name, species, description, imageUrl;
  int dateAdded, id;

  CropData(this.id, this.name, this.species, this.description, {this.imageUrl});

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  static CropData fromJson(Map<String, dynamic> parsedJson) {
    return CropData(
      parsedJson['id'],
      parsedJson['name'],
      parsedJson['species'],
      parsedJson['description'],
      imageUrl: parsedJson['url'] != null ? parsedJson['url'] : '',
    );
  }
}
