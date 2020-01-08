class Card{
  void limit(){}
  void services(){}
  int cashBackOffers(){}
}
class GoldCard implements Card{
  @override
  int cashBackOffers() {
    // TODO: implement cashBackOffers
    return 10;
  }

  @override
  void limit() {
    print("Limit 5 Lakh");
    // TODO: implement limit
  }

  @override
  void services() {
    // TODO: implement services
  }
  
}
class SilverCard implements Card{
  @override
  int cashBackOffers() {
    // TODO: implement cashBackOffers
    return 3;
  }

  @override
  void limit() {
    print("1 Lakh");
    // TODO: implement limit
  }

  @override
  void services() {
    print("Limited Services");
    // TODO: implement services
  }
  
}