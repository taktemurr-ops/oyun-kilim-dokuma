import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kilim_dokuma/oyun_kilim_dokuma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kilimDokumaConfig.title.length, 33);
    expect(kilimDokumaConfig.tagline.length, 33);
    for (final s in kilimDokumaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kilimDokumaConfig.gameId, kilimDokumaId);
    expect(kilimDokumaRules.gameId, kilimDokumaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kilimDokumaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kilimDokumaId, optionalMechanics: kilimDokumaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kilimDokumaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
