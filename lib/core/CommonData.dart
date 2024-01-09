Map<String, String> activeCityImageMap() {
  Map<String, String> activeMap = Map();
  activeMap["bangalore"] = "assets/ic_city_bengalore_active.svg";
  activeMap["hyderabad"] = "assets/ic_city_hyderabad_active.svg";
  activeMap["mumbai"] = "assets/ic_city_mumbai_active.svg";
  activeMap["ncr"] = "assets/ic_city_delhi_active.svg";
  activeMap["chennai"] = "assets/ic_city_chennai_active.svg";
  activeMap["pune"] = "assets/ic_city_pune_active.svg";
  return activeMap;
}

Map<String, String> inactiveCityImageMap() {
  Map<String, String> inactiveMap = Map();
  inactiveMap["bangalore"] = "assets/ic_city_bengalore.svg";
  inactiveMap["hyderabad"] = "assets/ic_city_hyderabad.svg";
  inactiveMap["mumbai"] = "assets/ic_city_mumbai.svg";
  inactiveMap["ncr"] = "assets/ic_city_delhi.svg";
  inactiveMap["chennai"] = "assets/ic_city_chennai.svg";
  inactiveMap["pune"] = "assets/ic_city_pune.svg";
  return inactiveMap;
}

String getActiveCityImage(String? key) {
  if (key != null) {
    return activeCityImageMap()[key.toLowerCase()]!;
  }
  return "";
}

String getInActiveCityImage(String? key) {
  if (key != null) {
    return inactiveCityImageMap()[key.toLowerCase()]!;
  }
  return "";
}

List TnCHeadings = [
  "Cancellation Policy",
  "Modification Policy",
  "Highway toll, Inter-state tax & parking charges",
];

List TncDetails = [
  "Cancellation allowed (with charges) up till 3 hrs. before the trip start time. For bookings cancelled 24 hrs. before the booking start time, Rs. 500/- will be charged. <a href="
      "><u>View detailed cancellation policy</u></a>",
  "Modification allowed (with charges). Car models, pickup location, start time & trip duration can be modified up till 3 hrs. before the trip start time. <a href="
      "><u>View detailed modification policy</u></a>",
  "To be paid by the user. Fast-Tags are installed in all our cars. The amount deducted from fast-tags will be billed to the customer in the invoice generated after the trip completion.",
];

List PricePlanDetail = [
  "Pricing plan cannot be changed after the creation of a booking. Extra Kms charge: Rs10/km",
  "We do not permit taking Revv vehicles to Leh/Ladakh region, Kaza/Nako region and Spiti Valley",
  "Click here for further details on without fuel and with fuel pricing plans",
  "For a higher security deposit (Rs 50,000), you have the option to avail lower fares, which excludes the coverage of insurance, wear-and-tear, etc (fleet management charges). For further details, please call us at +919250035555",
];

List PricePlanDetailShort = [
  "Pricing plan cannot be changed after the creation of a booking. Extra Kms charge: Rs10/km",
  "We do not permit taking Revv vehicles to Leh/Ladakh region, Kaza/Nako region and Spiti Valley",
  "Click here for further details on without fuel and with fuel pricing plans"
];
