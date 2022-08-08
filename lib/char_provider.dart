import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ricknmorty/char_model.dart';
import 'package:ricknmorty/char_notifier.dart';

final charProvider = StateNotifierProvider<CharNotifier, List<CharModel>>(
    (ref) => CharNotifier());
