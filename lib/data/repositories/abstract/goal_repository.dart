import 'package:stepper/data/model/models.dart';

abstract class GoalRepository {
  Future<void> setGoals(List<Goal> goals);

  Future<void> achieveGoal({
    required int goalId,
    required bool isAchieved,
    required DateTime updatedTime,
  });

  Future<List<Goal>> getPriorityGoals();
}
