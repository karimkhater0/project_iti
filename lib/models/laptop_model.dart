class LaptopModel {
  String vendor;
  String model;
  String cpu;
  String? gpu;
  String ram;
  String storage;
  String price;

  LaptopModel({
    required this.vendor,
    required this.model,
    required this.cpu,
    this.gpu,
    required this.ram,
    required this.storage,
    required this.price,
  });

  factory LaptopModel.fromMap(Map<String,dynamic> json)=>LaptopModel(
    vendor: json['vendor'],
    model: json['model'],
    cpu: json['cpu'],
    gpu: json['gpu'],
    ram: json['ram'],
    storage: json['storage'],
    price: json['price'],

  );



  toJson()
  {
    return {
      "vendor":vendor,
      "model":model,
      "cpu":cpu,
      "gpu":gpu,
      "ram":ram,
      "storage":storage,
      "price":price,


    };
  }
}