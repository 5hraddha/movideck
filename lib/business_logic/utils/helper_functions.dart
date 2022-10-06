// Get the year alone from the movie release date
String getYear(String? date) {
  return date!.substring(0, 4);
}

// Get the runtime in hours and minutes from the total duration in minutes
String getRuntime(int? totalDurationsInMinutes) {
  final durationsInHours = totalDurationsInMinutes! ~/ 60;
  final durationsInMinutes = totalDurationsInMinutes! % 60;
  return '${durationsInHours}h ${durationsInMinutes}min';
}
