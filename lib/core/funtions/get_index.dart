import 'package:fitness_and_nutrition/core/funtions/day_of_week.dart';

import '../../domain/entity/infomation.dart';

int getIndex(List<Infomation> listInfo, int choose) {
  int index = -1;
  if (listInfo.isNotEmpty) {
    for (int i = listInfo.length - 1; i >= 0; i--) {
      if (DateTime.parse(listInfo[i].dateTime)
              .difference(getWeek(DateTime.now())[choose])
              .inDays <=
          0) {
        index = i;
        break;
      }
    }
  }

  return index;
}
