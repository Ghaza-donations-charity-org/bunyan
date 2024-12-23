import 'donation_item.dart';

class PredefinedDonationItems {
  static final List<DonationItem> items = [
    DonationItem(name: "Clothes", points: 10),
    DonationItem(name: "Blankets", points: 15),
    DonationItem(name: "Electronics", points: 20),
    DonationItem(name: "Furniture", points: 25),
  ];

  static DonationItem? findItemByName(String name) {
    for (var item in items) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }
}
