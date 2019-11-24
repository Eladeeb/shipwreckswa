class Zone{
int id , wreckCount;
String name , image ;

Zone(this.id, this.wreckCount, this.name, this.image);

Zone.fromJson(Map<String,dynamic> jsonObject){
  this.id = jsonObject['id'];
  this.wreckCount = jsonObject['wrecks_count'];
  this.name = jsonObject['name'];
  this.image = jsonObject['image_url'];
}

}