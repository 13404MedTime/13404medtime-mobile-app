class BestDistanceAndHeart {
  BestDistanceAndHeart({
    this.bestDistance,
    this.bestTime,
  });

  BestDistanceAndHeart.fromJson(Map json) {
    bestDistance = json['data']['data']['data']['best_distance'];
    bestTime = json['data']['data']['data']['best_time'];
  }

  num? bestDistance;
  num? bestTime;
}
