import 'package:desafio_supremo/data/models/goal_model.dart';

class SavingsRepository {
  List<Savings> savingsList = [];

  List<Savings> addSavings(
    String title,
    String description,
    double savings,
    double saving, [
    isCompleted = false,
  ]) {
    final savingsItem = Savings(
      title,
      description,
      saving,
      savings,
      isCompleted: false,
    );
    savingsList.add(savingsItem);
    return savingsList;
  }

  List<Savings> removeSavings(String title) {
    savingsList.removeWhere((element) => element.title == title);
    return savingsList;
  }

  List<Savings> updateSavingsState(bool isCompleted, String title) {
    for (Savings element in savingsList) {
      if (element.title == title) {
        element.isCompleted = isCompleted;
      }
    }
    return savingsList;
  }
}
