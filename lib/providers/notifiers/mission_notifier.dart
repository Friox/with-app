import 'package:app/models/mission_model.dart';
import 'package:app/providers/repositories/mission_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final container = ProviderContainer();
final missionRepository = MissionRepository(container);

final missionInboundListProvider = FutureProvider<List<Mission>>((ref) async {
  print('test');
  final inboundData = await missionRepository.getMissionList(0);
  print(inboundData);
  return inboundData;
});

final missionOutboundListProvider = FutureProvider<List<Mission>>((ref) async {
  final outboundData = await missionRepository.getMissionList(1);
  return outboundData;
});

void fetchInboundMission(WidgetRef ref) {
  ref.invalidate(missionInboundListProvider);
}

void fetchOutboundMission(WidgetRef ref) {
  ref.invalidate(missionInboundListProvider);
}