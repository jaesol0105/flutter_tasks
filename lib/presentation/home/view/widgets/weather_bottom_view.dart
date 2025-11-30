import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:tasks/presentation/home/view_model/weather_view_model.dart';

class WeatherBottomView extends HookConsumerWidget {
  const WeatherBottomView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherViewModelProvider);

    return state.when(
      data: (weather) {
        final formattedDate = DateFormat("yy년 MM월 dd일 HH시 mm분").format(weather.time);
        final bool isDay = weather.isDay == 1;
        final String emoji = isDay ? '☀️' : '🌙';

        return Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 46),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('업데이트 시간 : $formattedDate ', style: const TextStyle(fontSize: 13)),
                  Text(emoji, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '날씨: ${weather.weatherDescription},   '
                    '온도: ${weather.temperature.toStringAsFixed(1)}℃,   '
                    '풍속: ${weather.windSpeed}m/s',
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        );
      },

      loading: () => Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).colorScheme.surface,
        child: const Text('날씨 불러오는 중', textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
      ),

      error: (e, _) => Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).colorScheme.surface,
        child: Text('Error: $e', textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
      ),
    );
  }
}
