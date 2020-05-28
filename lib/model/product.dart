// class ProductModel {
//   String productname;
//   String price;
//   String img;

//   ProductModel(
//     this.productname,
//     this.price,
//     this.img,
//   );

//   ProductModel.fromMap(dynamic obj) {
//     this.price = obj["price"];
//     this.productname = obj["title"];
//     this.img = obj["img"];
//   }

//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();

//     map["price"] = productname;
//     map["price"] = price;
//     map["img"] = img;

//     return map;
//   }

//   //Getters
//   String get getPrice => price;
//   String get getProductname => productname;
//   String get getImg => img;
// }


class Product {

	int _id;
	String _title;
	String _price;
	String _img;

	Product(this._title, this._img, [this._price] );

	Product.withId(this._id, this._title, this._img, [this._price]);

	int get id => _id;

	String get title => _title;

	String get price => _price;

	String get img => _img;


	set title(String newTitle) {
		if (newTitle.length <= 255) {
			this._title = newTitle;
		}
	}
	set setPrice(String newPrice) {
		if (newPrice.length <= 255) {
			this._price = newPrice;
		}
	}

	set setImg(String newImg) {
		this._img = newImg;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['description'] = _price;
		map['date'] = _img;

		return map;
	}

	// Extract a Note object from a Map object
	Product.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._price = map['description'];
		this._img = map['date'];
	}
}