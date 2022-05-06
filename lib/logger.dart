import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:roggle/roggle.dart';

/// フィルターに便利なロガー名
const loggerName = '[APP]';

final logger = kReleaseMode
    // リリースビルド時は FirebaseCrashlytics にエラーレポートを送信する
    ? Roggle.crashlytics(
        printer: CrashlyticsPrinter(
          errorLevel: Level.error, // error 以上のログはエラーレポートを送信する
          onError: (event) {
            FirebaseCrashlytics.instance.recordError(
              event.exception,
              event.stack,
              fatal: true, // true にするとエラーレポートを即時送信する
            );
          },
          onLog: (event) {
            // ここで記録したログは、firebase コンソールのログタブに表示される
            FirebaseCrashlytics.instance.log(event.message);
          },
          loggerName: loggerName,
        ),
      )
    // デバッグビルド時はコンソールに出力する
    : Roggle(
        printer: SinglePrettyPrinter(
          loggerName: loggerName,
          stackTraceLevel: Level.warning, // warning 以上のときはスタックトレースを出力する
        ),
        output: _AssertionOutput(),
      );

class _AssertionOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) {
    super.output(event);

    // error 以上のときは処理を停止する
    if (event.level.index >= Level.error.index) {
      throw AssertionError('Stopped by logger.');
    }
  }
}
