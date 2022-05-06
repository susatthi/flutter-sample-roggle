import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:roggle/roggle.dart';

const loggerName = '[APP]';

final logger = kReleaseMode
    ? Roggle.crashlytics(
        printer: CrashlyticsPrinter(
          errorLevel: Level.error,
          onError: (event) {
            FirebaseCrashlytics.instance.recordError(
              event.exception,
              event.stack,
              fatal: true,
            );
          },
          onLog: (event) {
            FirebaseCrashlytics.instance.log(event.message);
          },
          loggerName: loggerName,
        ),
      )
    : Roggle(
        printer: SinglePrettyPrinter(
          loggerName: loggerName,
          stackTraceLevel: Level.warning,
        ),
        output: _AssertionOutput(),
      );

class _AssertionOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) {
    super.output(event);
    if (event.level.index >= Level.error.index) {
      throw AssertionError('Stopped by logger.');
    }
  }
}
