class Calcute{
  static double hesapla(toplam, gelen, islem) {
    if (islem == "+") {
      toplam += gelen;
    } else if (islem == "-") {
      toplam -= gelen;
    } else if (islem == "x") {
      toplam *= gelen;
    } else if (islem == "/") {
      toplam /= gelen;
    } else if (islem == "%") {
      toplam = (toplam * gelen) / 100;
    } else if (islem == "+/-") {
      toplam = gelen - toplam;
    }
    return toplam;
  }
}