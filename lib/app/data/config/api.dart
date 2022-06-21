class Api {
  //* Creating instance constructor;
  static Api instance = Api();
  //* Base API URL
  // static const domain ="http://192.168.182.43/CF-penyakit-tulang-laravel/public";
  // static const baseURL = domain + "/api";
  // static const imageURL = "$domain/public/storage/product_photos_thumb";
  // static const imageUserURL = "$domain/public/storage/user_photos_thumb";

  static const domain = "https://tiwi.lp2muniprima.ac.id";
  static const baseURL = domain + "/api";
  static const imageURL = "$domain/storage/product_photos_thumb";
  static const imageUserURL = "$domain/storage/user_photos_thumb";

  String getPenyakits = "$baseURL/penyakit";
  String getGejalas = "$baseURL/gejala";
  String getBasis = "$baseURL/basis";
  String getLaporan = "$baseURL/laporan";
  String getUser = "$baseURL/user";
}
