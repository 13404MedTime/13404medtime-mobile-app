class AvarageDistanceAndHeart {
  AvarageDistanceAndHeart({
    this.avarageDistance,
    this.avarageHeart,
  });

  AvarageDistanceAndHeart.fromJson(Map json) {
    avarageDistance = json['data']['data']['data']['avarage_distance'];
    avarageHeart = json['data']['data']['data']['avarage_heart'];
  }

  num? avarageDistance;
  num? avarageHeart;
}
