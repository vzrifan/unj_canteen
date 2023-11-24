import 'dart:math';

enum IndicatorStatus { normal, less, crowded, medium }

IndicatorStatus getStatus() {
  List<IndicatorStatus> statusList = IndicatorStatus.values;

  Random random = Random();
  int randomIndex = random.nextInt(statusList.length);

  // Return the random element from the list
  return statusList[randomIndex];
}
