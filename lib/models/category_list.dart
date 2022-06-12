class CategoryDetails {
  String Cid;
  String title;
  String image;

  CategoryDetails({
    required this.Cid,
    required this.title,
    required this.image,
  });
}

List<CategoryDetails> CategoryList = [
  CategoryDetails(Cid: "C1", title: "Normal Apartments", image: ""),
  CategoryDetails(Cid: "C2", title: "Serviced Apartments", image: ""),
  CategoryDetails(Cid: "C3", title: "Street House", image: ""),
  CategoryDetails(Cid: "C4", title: "Room Rentals", image: ""),
  CategoryDetails(Cid: "C5", title: "Flat Rentals", image: ""),
];
