class CategoryDetails {
  String title;
  String image;

  CategoryDetails({
    required this.title,
    required this.image,
  });
}

List<CategoryDetails> CategoryList = [
  CategoryDetails(title: "Normal Apartments", image: ""),
  CategoryDetails(title: "Serviced Apartments", image: ""),
  CategoryDetails(title: "Street House", image: ""),
  CategoryDetails(title: "Room Rentals", image: ""),
  CategoryDetails(title: "Flat Rentals", image: ""),
]